package com.pang.back.Security;

import com.alibaba.dubbo.config.annotation.Reference;
import com.pang.back.Model.Staff;
import com.pang.back.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class MyStaffDetailsService implements UserDetailsService {
    @Reference
    private StaffService staffService;


    public UserDetails loadUserByUsername(String staffInfoID) throws UsernameNotFoundException {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        Staff staff = staffService.getStaffByID(Integer.parseInt(staffInfoID));
        if (staff == null) {
            throw new UsernameNotFoundException("用户不存在");
        }
        System.out.println(staff);
        String role = staff.getStaffRole();

        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        authorities.add(new SimpleGrantedAuthority("ROLE_" + role));

        // 添加用户拥有的多个角色
//        List<GrantedAuthority> grantedAuthorities = new ArrayList<>();
//        Set<Role> roles = user.getRoles();
//        for (Role role : roles) {
//            grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_" + role.getRole()));
//        }

        System.out.println(authorities);
        String staffID = String.valueOf(staff.getStaffID());

        return new User(
                staffID,
//                encoder.encode(staff.getStaffPassword()),
                staff.getStaffPassword(),
                authorities
        );
    }
}
