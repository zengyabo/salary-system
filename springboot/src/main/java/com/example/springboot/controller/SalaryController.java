package com.example.springboot.controller;

import cn.hutool.core.date.DateUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelWriter;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletOutputStream;
import java.net.URLEncoder;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.entity.Department;
import com.example.springboot.entity.Employee;
import com.example.springboot.service.IDepartmentService;
import com.example.springboot.service.IEmployeeService;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.io.InputStream;
import java.util.List;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.springboot.common.Result;
import org.springframework.web.multipart.MultipartFile;
import com.example.springboot.entity.User;
import com.example.springboot.utils.TokenUtils;

import com.example.springboot.service.ISalaryService;
import com.example.springboot.entity.Salary;

import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/salary")
public class SalaryController {

    @Resource
    private IDepartmentService departmentService;

    @Resource
    private ISalaryService salaryService;

    @Resource
    private IEmployeeService employeeService;

    private final String now = DateUtil.now();

    // 新增或者更新
    @PostMapping
    public Result save(@RequestBody Salary salary) {

        //总工资 = 基本工资+其他收入-扣款
        int sumSalary = salary.getBasicSalary();
        // 检查并设置 bonus 和 deduction 为0，如果它们为null
        if (salary.getBonus() == null) {
            salary.setBonus(0);
        }
        if (salary.getDeduction() == null) {
            salary.setDeduction(0);
        }
        sumSalary += salary.getBonus();
        sumSalary -= salary.getDeduction();

        salary.setTotalSalary(sumSalary);

        salaryService.saveOrUpdate(salary);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        salaryService.removeById(id);
        return Result.success();
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        salaryService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping
    public Result findAll() {
        return Result.success(salaryService.list());
    }

    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(salaryService.getById(id));
    }

    @GetMapping("/by-date-range")
    public Result findPage(@RequestParam(defaultValue = "") String name,
                           @RequestParam Integer pageNum,
                           @RequestParam Integer pageSize,
                           @RequestParam("startDate") String startDateStr,
                           @RequestParam("endDate") String endDateStr) {
        /*LocalDate startDate = LocalDate.parse(startDateStr, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        LocalDate endDate = LocalDate.parse(endDateStr, DateTimeFormatter.ofPattern("yyyy-MM-dd"));*/
        QueryWrapper<Salary> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        if (!"".equals(name)) {
            queryWrapper.like("employee", name);
        }
        // 假设startDateStr和endDateStr是有效的日期字符串，格式为'yyyy-MM-dd'
        if (StringUtils.isNotBlank(startDateStr)) {
            queryWrapper.ge("STR_TO_DATE(salary_date, '%Y-%m-%d')", startDateStr);
        }
        if (StringUtils.isNotBlank(endDateStr)) {
            // 通常不需要加一天，除非salary_date包含时间并且你想包含结束日期当天的所有数据
            queryWrapper.le("STR_TO_DATE(salary_date, '%Y-%m-%d')", endDateStr);
        }
        User currentUser = TokenUtils.getCurrentUser();
        if (currentUser.getRole().equals("ROLE_USER")) {
            //employee当前页面表中的字段
            queryWrapper.eq("employee", currentUser.getUsername());
        }
        List<Employee> employeeList = employeeService.list();
        Page<Salary> page = salaryService.page(new Page<>(pageNum, pageSize), queryWrapper);
        for (Salary record : page.getRecords()) {
            employeeList.stream()
                    .filter(employee -> employee.getName().equals(record.getEmployee()))
                    .findFirst()
                    .ifPresent(employee -> {
                        record.setEmployeeId(employee.getId());
                        // 在这里使用 salaryService 进行更新操作，将更改保存到数据库
                        salaryService.updateById(record);
                    });
        }
        return Result.success(page);
    }

    @GetMapping("/depart-page")
    public Result findPageByDepartmentName(@RequestParam Integer pageNum,
                                           @RequestParam Integer pageSize,
                                           @RequestParam(defaultValue = "") String departmentName) {
        // 1. 从Department表中根据部门名称查询部门ID
        QueryWrapper<Department> departmentQueryWrapper = new QueryWrapper<>();
        departmentQueryWrapper.eq("name", departmentName); // 假设Department实体有name字段表示部门名称
        Department department = departmentService.selectOne(departmentQueryWrapper);
      /*  if (department == null) {
            return Result.error("Department not found");
        }*/

        // 2. 使用部门ID从Employee表中查询员工ID列表
        QueryWrapper<Employee> employeeQueryWrapper = new QueryWrapper<>();
        employeeQueryWrapper.eq("department_id", department.getId()); // 假设Employee实体有department_id字段
        List<Employee> employeesInDepartment = employeeService.selectList(employeeQueryWrapper);
        List<Integer> employeeIds = employeesInDepartment.stream()
                .map(Employee::getId) // 假设Employee实体有getId方法
                .collect(Collectors.toList());

        // 3. 使用员工ID列表从Salary表中查询工资信息
        QueryWrapper<Salary> salaryQueryWrapper = new QueryWrapper<>();
        salaryQueryWrapper.in("employee_id", employeeIds); // 假设Salary实体有employee_id字段
        salaryQueryWrapper.orderByDesc("id"); // 按需排序
        Page<Salary> salaryPage = salaryService.page(new Page<>(pageNum, pageSize), salaryQueryWrapper);

        // 4. 返回查询到的工资信息
        return Result.success(salaryPage);
    }

    @GetMapping("/page")
    public Result findPage(@RequestParam(defaultValue = "") String name,
                           @RequestParam Integer pageNum,
                           @RequestParam Integer pageSize) {
        QueryWrapper<Salary> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        if (!"".equals(name)) {
            queryWrapper.like("employee", name);
        }
        User currentUser = TokenUtils.getCurrentUser();
        if (currentUser.getRole().equals("ROLE_USER")) {
            //employee当前页面表中的字段
            queryWrapper.eq("employee", currentUser.getUsername());
        }
        List<Employee> employeeList = employeeService.list();
        Page<Salary> page = salaryService.page(new Page<>(pageNum, pageSize), queryWrapper);
        for (Salary record : page.getRecords()) {
            employeeList.stream()
                    .filter(employee -> employee.getName().equals(record.getEmployee()))
                    .findFirst()
                    .ifPresent(employee -> {
                        record.setEmployeeId(employee.getId());
                        // 在这里使用 salaryService 进行更新操作，将更改保存到数据库
                        salaryService.updateById(record);
                    });
        }
        return Result.success(page);
    }

    /**
    * 导出接口
    */
    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<Salary> list = salaryService.list();
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);

        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        writer.write(list, true);

        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("Salary信息表", "UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");

        ServletOutputStream out = response.getOutputStream();
        writer.flush(out, true);
        out.close();
        writer.close();

        }

    /**
     * excel 导入
     * @param file
     * @throws Exception
     */
    @PostMapping("/import")
    public Result imp(MultipartFile file) throws Exception {
        InputStream inputStream = file.getInputStream();
        ExcelReader reader = ExcelUtil.getReader(inputStream);
        // 通过 javabean的方式读取Excel内的对象，但是要求表头必须是英文，跟javabean的属性要对应起来
        List<Salary> list = reader.readAll(Salary.class);

        salaryService.saveBatch(list);
        return Result.success();
    }

    private User getUser() {
        return TokenUtils.getCurrentUser();
    }

}

