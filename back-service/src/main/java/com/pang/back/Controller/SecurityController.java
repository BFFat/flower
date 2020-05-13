package com.pang.back.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

@RestController
@RequestMapping(value = "/security")
public class SecurityController {

//    @PreAuthorize("hasAnyRole('user')") // 只能user角色才能访问该方法
    @RequestMapping("/user")
    public String user(){
        System.out.println("***********************************************");
        return "user角色访问";
    }

//    @PreAuthorize("hasAnyRole('admin')") // 只能admin角色才能访问该方法
    @GetMapping("/admin")
    public String admin(){
        return "admin角色访问";
    }

    @RequestMapping(value = "/username", method = RequestMethod.GET)
    public String curretnUserName(Principal principal) {
        return principal.getName();
    }



}
