//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.8-b130911.1802 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2017.09.06 at 03:21:55 PM IST 
//
package com.infosys.utilities.coveragejacoco;

import javax.xml.bind.annotation.XmlRegistry;

@XmlRegistry
public class ObjectFactory {
	public Report createReport() {
		return new Report();
	}

	public Report.Package createReportPackage() {
		return new Report.Package();
	}

	public Report.Package.Sourcefile createReportPackageSourcefile() {
		return new Report.Package.Sourcefile();
	}

	public Report.Package.Class createReportPackageClass() {
		return new Report.Package.Class();
	}

	public Report.Package.Class.Method createReportPackageClassMethod() {
		return new Report.Package.Class.Method();
	}

	public Report.Sessioninfo createReportSessioninfo() {
		return new Report.Sessioninfo();
	}

	public Report.Counter createReportCounter() {
		return new Report.Counter();
	}

	public Report.Package.Counter createReportPackageCounter() {
		return new Report.Package.Counter();
	}

	public Report.Package.Sourcefile.Line createReportPackageSourcefileLine() {
		return new Report.Package.Sourcefile.Line();
	}

	public Report.Package.Sourcefile.Counter createReportPackageSourcefileCounter() {
		return new Report.Package.Sourcefile.Counter();
	}

	public Report.Package.Class.Counter createReportPackageClassCounter() {
		return new Report.Package.Class.Counter();
	}

	public Report.Package.Class.Method.Counter createReportPackageClassMethodCounter() {
		return new Report.Package.Class.Method.Counter();
	}
}