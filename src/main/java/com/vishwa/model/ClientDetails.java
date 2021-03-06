package com.vishwa.model;

import java.io.Serializable;

public class ClientDetails implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String status;
	String ip;
	public String getIp() {
		return ip;
	}



	public void setIp(String ip) {
		this.ip = ip;
	}

	String country;
	String countryCode;
	String region;
	String regionName;
	String city;
	String zip;
	String lat;
	String lon;
	String timezone;
	String isp;
	String as;
	String org;
	String query;
	String id;
	String visitorId;

	public ClientDetails() {

		setId(new java.util.Date().toString());
		visitorId=id;
	}



	public String getVisitorId() {
		return visitorId;
	}



	public void setVisitorId(String visitorId) {
		this.visitorId = visitorId;
	}



	public String getStatus() {
		return status;
	}

	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public void setStatus(String status) {
		this.status = status;
	}

	public String getCountry() {
		return country;
	}

	
	@Override
	public String toString() {
		return "ClientDetails [status=" + status + ", country=" + country + ", countryCode=" + countryCode + ", region="
				+ region + ", regionName=" + regionName + ", city=" + city + ", zip=" + zip + ", lat=" + lat + ", lon="
				+ lon + ", timezone=" + timezone + ", isp=" + isp + ", as=" + as + ", org=" + org + ", query=" + query
				+ ", id=" + id + ", visitorId=" + visitorId + "]";
	}



	public void setCountry(String country) {
		this.country = country;
	}

	public String getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getRegionName() {
		return regionName;
	}

	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLon() {
		return lon;
	}

	public void setLon(String lon) {
		this.lon = lon;
	}

	public String getTimezone() {
		return timezone;
	}

	public void setTimezone(String timezone) {
		this.timezone = timezone;
	}

	public String getIsp() {
		return isp;
	}

	public void setIsp(String isp) {
		this.isp = isp;
	}

	public String getAs() {
		return as;
	}

	public void setAs(String as) {
		this.as = as;
	}

	public String getOrg() {
		return org;
	}

	public void setOrg(String org) {
		this.org = org;
	}

	public String getQuery() {
		return query;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	
}
