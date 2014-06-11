package com.adopta.bean.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.ejb.Stateless;

@Stateless
public class ApplicationProperties implements ApplicationPropertiesLocal {
	public static final String UPDATE_PATH_FORMULA = "formula.update.wp.weight.per.style";
	public static final String SELECT_PATH_FORMULA = "formula.select.wp.per.style";
	
	public static final String PATH_FORMULA_PATH_WEIGHT_VAR = "wps";
	public static final String PATH_FORMULA_LEARNER_STYLE_VAR = "ls";
	public static final String UPDATE_PATH_FORMULA_LEARNER_RESULT_VAR = "r";
	public static final String SELECT_PATH_FORMULA_NUMBER_OF_LEARNERS_VAR = "cl";
	
    private static final String APPLICATION_PROPERTIES_FILE_NAME = "application.properties";

    public static String getProperty(String key) {
        InputStream propertiesInputStream = null;
        try {
        	Properties properties = new Properties();
            propertiesInputStream = ApplicationProperties.class.getResourceAsStream(APPLICATION_PROPERTIES_FILE_NAME);
            properties.load(propertiesInputStream);
            return (String) properties.get(key);
        
        } catch (IOException e) {
            e.printStackTrace();

        } finally {
            if (propertiesInputStream != null) {
                try {
                    propertiesInputStream.close();
                } catch (IOException e) {
                	e.printStackTrace();
                }
            }
        }
        
        return "";
    }
}

