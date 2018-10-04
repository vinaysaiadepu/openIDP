//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.8-b130911.1802 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2017.08.04 at 01:13:43 PM IST 
//
package com.infosys.utilities.qualitia;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlType;
import javax.xml.datatype.XMLGregorianCalendar;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "suite" })
@XmlRootElement(name = "Report")
public class QualitiaTest {
	@XmlElement(name = "Suite", required = true)
	protected List<QualitiaTest.Suite> suite;
	@XmlAttribute(name = "Browser")
	protected String browser;
	@XmlAttribute(name = "BrowserVersion")
	protected String browserVersion;
	@XmlAttribute(name = "BuildNumber")
	protected BigDecimal buildNumber;
	@XmlAttribute(name = "CreateDebugLog")
	protected Boolean createDebugLog;
	@XmlAttribute(name = "CreateErrorLog")
	protected Boolean createErrorLog;
	@XmlAttribute(name = "CreateInfoLog")
	protected Boolean createInfoLog;
	@XmlAttribute(name = "ExecutionType")
	protected String executionType;
	@XmlAttribute(name = "HostName")
	protected String hostName;
	@XmlAttribute(name = "OS")
	protected String os;
	@XmlAttribute(name = "OSVersion")
	protected BigDecimal osVersion;
	@XmlAttribute(name = "ProjectName")
	protected String projectName;
	@XmlAttribute(name = "ReleaseNumber")
	protected BigDecimal releaseNumber;
	@XmlAttribute(name = "SuiteExecutionID")
	protected String suiteExecutionID;
	@XmlAttribute(name = "SuiteIterationNumber")
	protected Integer suiteIterationNumber;
	@XmlAttribute(name = "Tool")
	protected String tool;
	@XmlAttribute(name = "UserName")
	protected Integer userName;

	public String getBrowser() {
		return browser;
	}

	public List<QualitiaTest.Suite> getSuite() {
		return suite;
	}

	public void setSuite(List<QualitiaTest.Suite> suite) {
		this.suite = suite;
	}

	public void setBrowser(String value) {
		this.browser = value;
	}

	public String getBrowserVersion() {
		return browserVersion;
	}

	public void setBrowserVersion(String value) {
		this.browserVersion = value;
	}

	public BigDecimal getBuildNumber() {
		return buildNumber;
	}

	public void setBuildNumber(BigDecimal value) {
		this.buildNumber = value;
	}

	public Boolean isCreateDebugLog() {
		return createDebugLog;
	}

	public void setCreateDebugLog(Boolean value) {
		this.createDebugLog = value;
	}

	public Boolean isCreateErrorLog() {
		return createErrorLog;
	}

	public void setCreateErrorLog(Boolean value) {
		this.createErrorLog = value;
	}

	public Boolean isCreateInfoLog() {
		return createInfoLog;
	}

	public void setCreateInfoLog(Boolean value) {
		this.createInfoLog = value;
	}

	public String getExecutionType() {
		return executionType;
	}

	public void setExecutionType(String value) {
		this.executionType = value;
	}

	public String getHostName() {
		return hostName;
	}

	public void setHostName(String value) {
		this.hostName = value;
	}

	public String getOS() {
		return os;
	}

	public void setOS(String value) {
		this.os = value;
	}

	public BigDecimal getOSVersion() {
		return osVersion;
	}

	public void setOSVersion(BigDecimal value) {
		this.osVersion = value;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String value) {
		this.projectName = value;
	}

	public BigDecimal getReleaseNumber() {
		return releaseNumber;
	}

	public void setReleaseNumber(BigDecimal value) {
		this.releaseNumber = value;
	}

	public String getSuiteExecutionID() {
		return suiteExecutionID;
	}

	public void setSuiteExecutionID(String value) {
		this.suiteExecutionID = value;
	}

	public Integer getSuiteIterationNumber() {
		return suiteIterationNumber;
	}

	public void setSuiteIterationNumber(Integer value) {
		this.suiteIterationNumber = value;
	}

	public String getTool() {
		return tool;
	}

	public void setTool(String value) {
		this.tool = value;
	}

	public Integer getUserName() {
		return userName;
	}

	public void setUserName(Integer value) {
		this.userName = value;
	}

	@XmlAccessorType(XmlAccessType.FIELD)
	@XmlType(name = "", propOrder = { "tCs" })
	public static class Suite {
		@XmlElement(name = "TCs", required = true)
		protected List<QualitiaTest.Suite.TCs> tCs;
		@XmlAttribute(name = "EndTime")
		@XmlSchemaType(name = "dateTime")
		protected XMLGregorianCalendar endTime;
		@XmlAttribute(name = "ExecutionTime")
		@XmlSchemaType(name = "dateTime")
		protected XMLGregorianCalendar executionTime;
		@XmlAttribute(name = "Id")
		protected String id;
		@XmlAttribute(name = "Name")
		protected String name;
		@XmlAttribute(name = "ScheduleName")
		protected String scheduleName;
		@XmlAttribute(name = "StartTime")
		@XmlSchemaType(name = "dateTime")
		protected XMLGregorianCalendar startTime;

		public XMLGregorianCalendar getEndTime() {
			return endTime;
		}

		public List<QualitiaTest.Suite.TCs> gettCs() {
			return tCs;
		}

		public void settCs(List<QualitiaTest.Suite.TCs> tCs) {
			this.tCs = tCs;
		}

		public void setEndTime(XMLGregorianCalendar value) {
			this.endTime = value;
		}

		public XMLGregorianCalendar getExecutionTime() {
			return executionTime;
		}

		public void setExecutionTime(XMLGregorianCalendar value) {
			this.executionTime = value;
		}

		public String getId() {
			return id;
		}

		public void setId(String value) {
			this.id = value;
		}

		public String getName() {
			return name;
		}

		public void setName(String value) {
			this.name = value;
		}

		public String getScheduleName() {
			return scheduleName;
		}

		public void setScheduleName(String value) {
			this.scheduleName = value;
		}

		public XMLGregorianCalendar getStartTime() {
			return startTime;
		}

		public void setStartTime(XMLGregorianCalendar value) {
			this.startTime = value;
		}

		@XmlAccessorType(XmlAccessType.FIELD)
		@XmlType(name = "", propOrder = { "tc" })
		public static class TCs {
			@XmlElement(name = "TC", required = true)
			protected List<QualitiaTest.Suite.TCs.TC> tc;

			public List<QualitiaTest.Suite.TCs.TC> getTC() {
				if (tc == null) {
					tc = new ArrayList<QualitiaTest.Suite.TCs.TC>();
				}
				return this.tc;
			}

			@XmlAccessorType(XmlAccessType.FIELD)
			@XmlType(name = "", propOrder = { "tcIteration" })
			public static class TC {
				@XmlElement(name = "TCIteration", required = true)
				protected QualitiaTest.Suite.TCs.TC.TCIteration tcIteration;
				@XmlAttribute(name = "Desc")
				protected String desc;
				@XmlAttribute(name = "ExecutionTime")
				@XmlSchemaType(name = "dateTime")
				protected XMLGregorianCalendar executionTime;
				@XmlAttribute(name = "ManualTCId")
				protected String manualTCId;
				@XmlAttribute(name = "OnError")
				protected String onError;
				@XmlAttribute(name = "ReportLink")
				protected String reportLink;
				@XmlAttribute(name = "RunId")
				protected String runId;
				@XmlAttribute(name = "ScenarioId")
				protected String scenarioId;
				@XmlAttribute(name = "ScenarioName")
				protected String scenarioName;
				@XmlAttribute(name = "StartTime")
				@XmlSchemaType(name = "dateTime")
				protected XMLGregorianCalendar startTime;
				@XmlAttribute(name = "Status")
				protected Integer status;
				@XmlAttribute(name = "TCName")
				protected String tcName;
				@XmlAttribute(name = "TCSeqId")
				protected Integer tcSeqId;
				@XmlAttribute(name = "TcId")
				protected String tcId;
				@XmlAttribute(name = "endTime")
				@XmlSchemaType(name = "dateTime")
				protected XMLGregorianCalendar endTime;

				public QualitiaTest.Suite.TCs.TC.TCIteration getTCIteration() {
					return tcIteration;
				}

				public void setTCIteration(QualitiaTest.Suite.TCs.TC.TCIteration value) {
					this.tcIteration = value;
				}

				public String getDesc() {
					return desc;
				}

				public void setDesc(String value) {
					this.desc = value;
				}

				public XMLGregorianCalendar getExecutionTime() {
					return executionTime;
				}

				public void setExecutionTime(XMLGregorianCalendar value) {
					this.executionTime = value;
				}

				public String getManualTCId() {
					return manualTCId;
				}

				public void setManualTCId(String value) {
					this.manualTCId = value;
				}

				public String getOnError() {
					return onError;
				}

				public void setOnError(String value) {
					this.onError = value;
				}

				public String getReportLink() {
					return reportLink;
				}

				public void setReportLink(String value) {
					this.reportLink = value;
				}

				public String getRunId() {
					return runId;
				}

				public void setRunId(String value) {
					this.runId = value;
				}

				public String getScenarioId() {
					return scenarioId;
				}

				public void setScenarioId(String value) {
					this.scenarioId = value;
				}

				public String getScenarioName() {
					return scenarioName;
				}

				public void setScenarioName(String value) {
					this.scenarioName = value;
				}

				public XMLGregorianCalendar getStartTime() {
					return startTime;
				}

				public void setStartTime(XMLGregorianCalendar value) {
					this.startTime = value;
				}

				public Integer getStatus() {
					return status;
				}

				public void setStatus(Integer value) {
					this.status = value;
				}

				public String getTCName() {
					return tcName;
				}

				public void setTCName(String value) {
					this.tcName = value;
				}

				public Integer getTCSeqId() {
					return tcSeqId;
				}

				public void setTCSeqId(Integer value) {
					this.tcSeqId = value;
				}

				public String getTcId() {
					return tcId;
				}

				public void setTcId(String value) {
					this.tcId = value;
				}

				public XMLGregorianCalendar getEndTime() {
					return endTime;
				}

				public void setEndTime(XMLGregorianCalendar value) {
					this.endTime = value;
				}

				@XmlAccessorType(XmlAccessType.FIELD)
				@XmlType(name = "")
				public static class TCIteration {
					@XmlAttribute(name = "ExecutionTime")
					@XmlSchemaType(name = "dateTime")
					protected XMLGregorianCalendar executionTime;
					@XmlAttribute(name = "IterationNo")
					protected Integer iterationNo;
					@XmlAttribute(name = "Status")
					protected Integer status;
					@XmlAttribute(name = "TCDataSetTag")
					protected String tcDataSetTag;

					public XMLGregorianCalendar getExecutionTime() {
						return executionTime;
					}

					public void setExecutionTime(XMLGregorianCalendar value) {
						this.executionTime = value;
					}

					public Integer getIterationNo() {
						return iterationNo;
					}

					public void setIterationNo(Integer value) {
						this.iterationNo = value;
					}

					public Integer getStatus() {
						return status;
					}

					public void setStatus(Integer value) {
						this.status = value;
					}

					public String getTCDataSetTag() {
						return tcDataSetTag;
					}

					public void setTCDataSetTag(String value) {
						this.tcDataSetTag = value;
					}
				}
			}
		}
	}
}