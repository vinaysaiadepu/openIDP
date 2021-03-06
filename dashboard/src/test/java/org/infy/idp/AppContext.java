package org.infy.idp;

import org.infy.idp.utils.ConfigurationManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AppContext {


	@Bean
	public ConfigurationManager configurationManager() {
		ConfigurationManager configurationManager = new ConfigurationManager();
		configurationManager.setIdpurl("jdbc:postgresql://idp_oss:5432/IDP");
		configurationManager.setPostgresqldatabase("i2p");
		configurationManager.setPostgresqlinitialsize("5");
		configurationManager.setPostgresqlpassword("root");
		configurationManager.setPostgresqlschemaname("public");
		configurationManager.setPostgresqlusername("postgres");
		configurationManager.setPostgresqlinitialsize("5");
		configurationManager.setIdppostgresqlinitialsize("5");
		configurationManager.setIdppostgresqldatabase("IDP");
		configurationManager.setIdppostgresqlusername("postgres");
		configurationManager.setIdppostgresqlpassword("root");
		configurationManager.setIdppostgresqlschemaname("public");
		configurationManager.setBatchSize("1");
		configurationManager.setUrl("jdbc:postgresql://idp_oss:5432/i2p");
		configurationManager.setJenkinsID("idp_oss");
		configurationManager.setJenkinsPassword("pwd1234+");
		configurationManager.setJenkinsURL("https://idp_oss:8085/jenkins");
		return configurationManager;
	}

}