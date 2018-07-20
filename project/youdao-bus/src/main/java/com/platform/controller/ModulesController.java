package com.platform.controller;

import com.platform.commons.utils.PageData;
import com.platform.mapper.ModulesMapper;
import com.platform.result.TreeResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

/**
 * 权限管理
 *
 * @author wuyudong
 */
@Controller
@RequestMapping("/modules")
public class ModulesController extends BaseController {

    @Autowired
    private ModulesMapper modulesMapper;

    /**
     * 菜单树(右边)
     * ss_modules/tree
     *
     * @return
     */
    @RequestMapping(value = "/system/tree", method = RequestMethod.POST)
    public ResponseEntity<Object> tree(String roles) {
        List<TreeResult> trees = new ArrayList<TreeResult>();
        if (roles != null) {
            List<PageData> resourceLists = modulesMapper.selectModulesListByRoleId(roles);
            trees = this.getTreeResult(resourceLists);
        }
        return ResponseEntity.ok(trees);
    }

    private List<TreeResult> getTreeResult(List<PageData> resourceList) {
        List<TreeResult> trees = new ArrayList<TreeResult>();
        try{
            if (resourceList == null) {
                return trees;
            }
            for (PageData pd : resourceList) {
                TreeResult tree = new TreeResult();
                tree.setId(pd.getLong("id"));
                tree.setPid(pd.getLong("pid"));
                tree.setText(pd.getString("name"));
                tree.setIconCls(pd.getString("icon"));
                tree.setAttributes(pd.getString("url"));
                tree.setOpenMode(pd.getString("open_mode"));
                tree.setState(pd.get("status").toString());
                if (pd.getLong("pid") != null) {
                    tree.setTargetType("iframe-tab");
                }
                trees.add(tree);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return trees;
    }


    /**
     * 获取全部的菜单
     * ss_modules/getModuleList
     *
     * @return
     */
    @RequestMapping(value = "/system/getModuleList", method = RequestMethod.POST)
    public ResponseEntity<Object> getModuleList() {
        List<PageData> selectList = new ArrayList<PageData>();
        try {
            //获取父类标签
            PageData pd = new PageData();
            pd.put("pid", 0);
            selectList = modulesMapper.selectList(pd);
            for (PageData sne : selectList) {
                //从内层开始
                String id = sne.get("id").toString();
                if (id.length() == 1) {
                    sne.put("moduleId", "0" + id);
                } else {
                    sne.put("moduleId", id);
                }
                PageData childraPd = new PageData();
                childraPd.put("pid", id);
                List<PageData> selectList2 = modulesMapper.selectList(childraPd);
                for (PageData twosne : selectList2) {
                    String twosneId = twosne.get("id").toString();
                    if (twosneId.length() == 1) {
                        twosne.put("moduleId", "0" + twosneId);
                    } else {
                        twosne.put("moduleId", twosneId);
                    }
                    PageData nextChildraPd = new PageData();
                    nextChildraPd.put("pid", twosneId);
                    List<PageData> selectList3 = modulesMapper.selectList(nextChildraPd);
                    for (PageData threesne : selectList3) {
                        String threesneId = threesne.get("id").toString();
                        if (threesneId.length() == 1) {
                            threesne.put("moduleId", "0" + threesneId);
                        } else {
                            threesne.put("moduleId", threesneId);
                        }
                    }
                    twosne.put("list", selectList3);
                }
                sne.put("list", selectList2);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.ok(selectList);
    }


}
