package com.myClass.Dao;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

public class GetQuery extends PropertyPlaceholderConfigurer {
    private Map<String, String> properties;

    @Override
    protected void processProperties(ConfigurableListableBeanFactory beanFactoryToProcess, Properties props) throws BeansException {
        Map<String, String> properties = new HashMap<String, String>();
        super.processProperties(beanFactoryToProcess, props);
        for (Entry<Object, Object> entry : props.entrySet()) {
            properties.put(String.valueOf(entry.getKey()), String.valueOf(entry.getValue()));
        }
        this.properties = Collections.unmodifiableMap(properties);
    }


    public String get(String key) {
        return this.properties.get(key);
    }
}