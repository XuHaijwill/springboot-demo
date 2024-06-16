package org.example.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.example.domain.entity.SysUser;
import org.example.mapper.SysUserMapper;
import org.example.service.ISysUserService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 增加 AllArgsConstructor 则不需要添加automation注解
 */
@Slf4j
@Service
@AllArgsConstructor
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser>  implements ISysUserService {

    private SysUserMapper sysUserMapper;

    @Override
    public IPage selectPageVo(SysUser user, IPage page) {
        sysUserMapper.selectPage(page, null);
        if(!page.getRecords().isEmpty()){
            page.getRecords().forEach(data->{
                log.info("{}",data);
            });
        }
        log.info("selectPage end");
        return page;
    }

    @Override
    public List<SysUser> selectUserList(SysUser user) {
        return null;
    }

    @Override
    public List<SysUser> selectAllocatedList(SysUser user) {
        return null;
    }

    @Override
    public List<SysUser> selectUnallocatedList(SysUser user) {
        return null;
    }

    @Override
    public SysUser selectUserByUserName(String userName) {
        return null;
    }

    @Override
    public SysUser selectUserById(Long userId) {
        return null;
    }

    @Override
    public String selectUserRoleGroup(String userName) {
        return null;
    }

    @Override
    public String selectUserPostGroup(String userName) {
        return null;
    }

    @Override
    public boolean checkUserNameUnique(SysUser user) {
        return false;
    }

    @Override
    public boolean checkPhoneUnique(SysUser user) {
        return false;
    }

    @Override
    public boolean checkEmailUnique(SysUser user) {
        return false;
    }

    @Override
    public void checkUserAllowed(SysUser user) {

    }

    @Override
    public void checkUserDataScope(Long userId) {

    }

    @Override
    public int insertUser(SysUser user) {
        return 0;
    }

    @Override
    public boolean registerUser(SysUser user) {
        return false;
    }

    @Override
    public int updateUser(SysUser user) {
        return 0;
    }

    @Override
    public void insertUserAuth(Long userId, Long[] roleIds) {

    }

    @Override
    public int updateUserStatus(SysUser user) {
        return 0;
    }

    @Override
    public int updateUserProfile(SysUser user) {
        return 0;
    }

    @Override
    public boolean updateUserAvatar(String userName, String avatar) {
        return false;
    }

    @Override
    public int resetPwd(SysUser user) {
        return 0;
    }

    @Override
    public int resetUserPwd(String userName, String password) {
        return 0;
    }

    @Override
    public int deleteUserById(Long userId) {
        return 0;
    }

    @Override
    public int deleteUserByIds(Long[] userIds) {
        return 0;
    }

    @Override
    public String importUser(List<SysUser> userList, Boolean isUpdateSupport, String operName) {
        return null;
    }
}
