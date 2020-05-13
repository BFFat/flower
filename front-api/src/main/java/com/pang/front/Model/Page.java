package com.pang.front.Model;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class Page<T> implements Serializable {
    private int pageSize = 8; //每页显示条数
    private int totalCount; //总条数
    private int start; //开始条数
    private int pageNo;//当前页
    private int totalPages; //总页数
    private List<T> pageList;//数据

    public Page(int totalCount) {
        this.totalCount = totalCount;
    }

    /**
     * 获取下一条
     */
    public int getCurrentPageNo() {
        return start / pageSize + 1;
    }

    /**
     * 是否有下一条
     *
     * @return
     */
    public boolean getHasNextPage() {
        return getCurrentPageNo() < totalPages;
    }

    /**
     * 当前页是否大于1
     *
     * @return
     */
    public boolean getHasPavPage() {
        return getCurrentPageNo() > 1;
    }

    /**
     * 获取总页数
     *
     * @return
     */
    public int getTotalPages() {
        totalPages = totalCount / pageSize;

        if (totalCount % pageSize != 0) {
            totalPages++;
        }

        return totalPages;
    }

    /**
     * 设置当前页的开始条数
     *
     * @param pageNo
     * @return
     */
    public int getStart(int pageNo) {
        if (pageNo < 1) {
            pageNo = 1;
        } else if (getTotalPages() > 0 && pageNo > getTotalPages()) {
            pageNo = getTotalPages();
        }

        start = (pageNo - 1) * pageSize;
        return start;
    }
}
