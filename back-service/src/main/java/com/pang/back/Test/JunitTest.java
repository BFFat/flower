package com.pang.back.Test;


import com.pang.back.Mapper.StaffInfoMapper;
import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.TransportAddress;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightBuilder;
import org.elasticsearch.transport.client.PreBuiltTransportClient;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;

public class JunitTest {
    private TransportClient client;

    @Autowired
    private StaffInfoMapper staffInfoMapper;

    @Before
    public void getData() throws Exception {
        Settings settings = Settings.builder().put("cluster.name", "smallpang").build();
        client = new PreBuiltTransportClient(settings);
        client.addTransportAddress(new TransportAddress(InetAddress.getByName("localhost"), 9300));
        System.out.println(client.toString());

       /* GetResponse response = client.prepareGet("user", "_doc", "10003").get();
        System.out.println(response.getSourceAsString());*/

    }

    @Test
    public void rtnTime() {
        Date date = new Date();
        SimpleDateFormat dateformat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        String time = dateformat.format(date);
        System.out.println("现在的时间是" + time);
    }

    @Test
    public void testQueryStringQuery() throws Exception {
        QueryBuilder queryBuilder = QueryBuilders.queryStringQuery("骗子");
        search(queryBuilder);
        client.close();
    }

    public void search (QueryBuilder queryBuilder) throws Exception {
        SearchResponse searchResponse = client.prepareSearch("user")
                .setTypes("_doc")
                .setQuery(queryBuilder)
                .setFrom(0)
                .setSize(10)
                .get();

        SearchHits searchHit = searchResponse.getHits();
        System.out.println("查询条数：" + searchHit.getTotalHits());
        Iterator<SearchHit> iterator = searchHit.iterator();
        while (iterator.hasNext()) {
            SearchHit next = iterator.next();
            System.out.println( next.getSourceAsString());
        }

    }

    @Test
    public void highlight() {
        HighlightBuilder highlightBuilder = new HighlightBuilder();
        // highlightBuilder.preTags(FragmentSettings.prefix);//设置前缀
        // highlightBuilder.postTags(FragmentSettings.subfix);//设置后缀
        highlightBuilder.field("about");
        // highlightBuilder.fragmenter(FragmentSettings.SPAN)
        // .fragmentSize(FragmentSettings.HIGHLIGHT_MAX_WORDS).numOfFragments(5);
        SearchRequestBuilder requestBuilder = client.prepareSearch("user").setTypes("_doc")
                .setQuery(QueryBuilders.matchPhraseQuery("username", "骗子")).highlighter(highlightBuilder);
        System.out.println(requestBuilder.toString());

        SearchResponse response = requestBuilder.execute().actionGet();

        System.out.println(response.status());
        if (response.status().getStatus() == 200) {
            for (SearchHit hits : response.getHits().getHits()) {
                System.out.println(hits.getSourceAsString());
                // 这里使用hight field来覆盖source里面的字段即可
                System.out.println(hits.getHighlightFields());
            }
        }
    }































}
