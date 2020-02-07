--
-- PostgreSQL database dump
--

-- Dumped from database version 10.7
-- Dumped by pg_dump version 12.0

-- Started on 2020-02-07 08:23:41

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 9 (class 2615 OID 19557)
-- Name: config; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA config;


ALTER SCHEMA config OWNER TO postgres;

SET default_tablespace = '';

--
-- TOC entry 216 (class 1259 OID 19687)
-- Name: asset; Type: TABLE; Schema: config; Owner: postgres
--

CREATE TABLE config.asset (
    assetid integer NOT NULL,
    switchboardid integer,
    feederlineid integer,
    zoneid integer NOT NULL,
    plantid integer NOT NULL,
    category character varying(10) NOT NULL,
    type character(2) NOT NULL,
    assetmodelno character varying(100) NOT NULL,
    extraattributes json,
    healthstatus character(1) DEFAULT 'G'::bpchar,
    active boolean DEFAULT true,
    creartedby character varying(100) NOT NULL,
    createddate timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    updatedby character varying(100),
    updateddate timestamp without time zone
);


ALTER TABLE config.asset OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 19685)
-- Name: asset_assetid_seq; Type: SEQUENCE; Schema: config; Owner: postgres
--

CREATE SEQUENCE config.asset_assetid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE config.asset_assetid_seq OWNER TO postgres;

--
-- TOC entry 4190 (class 0 OID 0)
-- Dependencies: 215
-- Name: asset_assetid_seq; Type: SEQUENCE OWNED BY; Schema: config; Owner: postgres
--

ALTER SEQUENCE config.asset_assetid_seq OWNED BY config.asset.assetid;


--
-- TOC entry 226 (class 1259 OID 19741)
-- Name: bindefinition; Type: TABLE; Schema: config; Owner: postgres
--

CREATE TABLE config.bindefinition (
    bindefid integer NOT NULL,
    assetid integer NOT NULL,
    bintypeid integer NOT NULL,
    binstart real NOT NULL,
    binstop real NOT NULL,
    binwidth real NOT NULL,
    active boolean DEFAULT true,
    creartedby character varying(100) NOT NULL,
    createddate timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    updatedby character varying(100),
    updateddate timestamp without time zone
);


ALTER TABLE config.bindefinition OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 19739)
-- Name: bindefinition_bindefid_seq; Type: SEQUENCE; Schema: config; Owner: postgres
--

CREATE SEQUENCE config.bindefinition_bindefid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE config.bindefinition_bindefid_seq OWNER TO postgres;

--
-- TOC entry 4191 (class 0 OID 0)
-- Dependencies: 225
-- Name: bindefinition_bindefid_seq; Type: SEQUENCE OWNED BY; Schema: config; Owner: postgres
--

ALTER SEQUENCE config.bindefinition_bindefid_seq OWNED BY config.bindefinition.bindefid;


--
-- TOC entry 224 (class 1259 OID 19731)
-- Name: bintype; Type: TABLE; Schema: config; Owner: postgres
--

CREATE TABLE config.bintype (
    bintypeid integer NOT NULL,
    bintypename character varying(100) NOT NULL,
    active boolean DEFAULT true,
    creartedby character varying(100) NOT NULL,
    createddate timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    updatedby character varying(100),
    updateddate timestamp without time zone
);


ALTER TABLE config.bintype OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 19729)
-- Name: bintype_bintypeid_seq; Type: SEQUENCE; Schema: config; Owner: postgres
--

CREATE SEQUENCE config.bintype_bintypeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE config.bintype_bintypeid_seq OWNER TO postgres;

--
-- TOC entry 4192 (class 0 OID 0)
-- Dependencies: 223
-- Name: bintype_bintypeid_seq; Type: SEQUENCE OWNED BY; Schema: config; Owner: postgres
--

ALTER SEQUENCE config.bintype_bintypeid_seq OWNED BY config.bintype.bintypeid;


--
-- TOC entry 200 (class 1259 OID 19560)
-- Name: client; Type: TABLE; Schema: config; Owner: postgres
--

CREATE TABLE config.client (
    clientid integer NOT NULL,
    clientname character varying(50) NOT NULL,
    contactname character varying(50) NOT NULL,
    contactphone character varying(40) NOT NULL,
    contactemail character varying(50) NOT NULL,
    address character varying(300) NOT NULL,
    bucketdetails character varying(50),
    healthstatus character(1) DEFAULT 'G'::bpchar,
    active boolean DEFAULT true,
    createdby character varying(100) NOT NULL,
    createddate timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    updatedby character varying(100),
    updateddate timestamp without time zone
);


ALTER TABLE config.client OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 19558)
-- Name: client_clientid_seq; Type: SEQUENCE; Schema: config; Owner: postgres
--

CREATE SEQUENCE config.client_clientid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE config.client_clientid_seq OWNER TO postgres;

--
-- TOC entry 4193 (class 0 OID 0)
-- Dependencies: 199
-- Name: client_clientid_seq; Type: SEQUENCE OWNED BY; Schema: config; Owner: postgres
--

ALTER SEQUENCE config.client_clientid_seq OWNED BY config.client.clientid;


--
-- TOC entry 230 (class 1259 OID 19761)
-- Name: faultdefinition; Type: TABLE; Schema: config; Owner: postgres
--

CREATE TABLE config.faultdefinition (
    faultdefid integer NOT NULL,
    assetid integer NOT NULL,
    faulttypeid integer NOT NULL,
    faultdeftypeid integer NOT NULL,
    faultvalue real NOT NULL,
    active boolean DEFAULT true,
    creartedby character varying(100) NOT NULL,
    createddate timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    updatedby character varying(100),
    updateddate timestamp without time zone
);


ALTER TABLE config.faultdefinition OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 19759)
-- Name: faultdefinition_faultdefid_seq; Type: SEQUENCE; Schema: config; Owner: postgres
--

CREATE SEQUENCE config.faultdefinition_faultdefid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE config.faultdefinition_faultdefid_seq OWNER TO postgres;

--
-- TOC entry 4194 (class 0 OID 0)
-- Dependencies: 229
-- Name: faultdefinition_faultdefid_seq; Type: SEQUENCE OWNED BY; Schema: config; Owner: postgres
--

ALTER SEQUENCE config.faultdefinition_faultdefid_seq OWNED BY config.faultdefinition.faultdefid;


--
-- TOC entry 228 (class 1259 OID 19751)
-- Name: faultdeftypes; Type: TABLE; Schema: config; Owner: postgres
--

CREATE TABLE config.faultdeftypes (
    faultdeftypeid integer NOT NULL,
    faultdeftypname character varying(100) NOT NULL,
    active boolean DEFAULT true,
    creartedby character varying(100) NOT NULL,
    createddate timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    updatedby character varying(100),
    updateddate timestamp without time zone
);


ALTER TABLE config.faultdeftypes OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 19749)
-- Name: faultdeftypes_faultdeftypeid_seq; Type: SEQUENCE; Schema: config; Owner: postgres
--

CREATE SEQUENCE config.faultdeftypes_faultdeftypeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE config.faultdeftypes_faultdeftypeid_seq OWNER TO postgres;

--
-- TOC entry 4195 (class 0 OID 0)
-- Dependencies: 227
-- Name: faultdeftypes_faultdeftypeid_seq; Type: SEQUENCE OWNED BY; Schema: config; Owner: postgres
--

ALTER SEQUENCE config.faultdeftypes_faultdeftypeid_seq OWNED BY config.faultdeftypes.faultdeftypeid;


--
-- TOC entry 222 (class 1259 OID 19721)
-- Name: faulttype; Type: TABLE; Schema: config; Owner: postgres
--

CREATE TABLE config.faulttype (
    faulttypeid integer NOT NULL,
    faultname character varying(100) NOT NULL,
    active boolean DEFAULT true,
    creartedby character varying(100) NOT NULL,
    createddate timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    updatedby character varying(100),
    updateddate timestamp without time zone
);


ALTER TABLE config.faulttype OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 19719)
-- Name: faulttype_faulttypeid_seq; Type: SEQUENCE; Schema: config; Owner: postgres
--

CREATE SEQUENCE config.faulttype_faulttypeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE config.faulttype_faulttypeid_seq OWNER TO postgres;

--
-- TOC entry 4196 (class 0 OID 0)
-- Dependencies: 221
-- Name: faulttype_faulttypeid_seq; Type: SEQUENCE OWNED BY; Schema: config; Owner: postgres
--

ALTER SEQUENCE config.faulttype_faulttypeid_seq OWNED BY config.faulttype.faulttypeid;


--
-- TOC entry 212 (class 1259 OID 19647)
-- Name: feederline; Type: TABLE; Schema: config; Owner: postgres
--

CREATE TABLE config.feederline (
    feederlineid integer NOT NULL,
    zoneid integer NOT NULL,
    plantid integer NOT NULL,
    feedername character varying(100) NOT NULL,
    extraattributes json,
    active boolean DEFAULT true,
    healthstatus character(1) DEFAULT 'G'::bpchar,
    assetgreencnt integer DEFAULT 0,
    assetyellowcnt integer DEFAULT 0,
    assetredcnt integer DEFAULT 0,
    alertcriticalcnt integer DEFAULT 0,
    alertmediumcnt integer DEFAULT 0,
    alertlowcnt integer DEFAULT 0,
    creartedby character varying(100) NOT NULL,
    createddate timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    updatedby character varying(100),
    updateddate timestamp without time zone
);


ALTER TABLE config.feederline OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 19645)
-- Name: feederline_feederlineid_seq; Type: SEQUENCE; Schema: config; Owner: postgres
--

CREATE SEQUENCE config.feederline_feederlineid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE config.feederline_feederlineid_seq OWNER TO postgres;

--
-- TOC entry 4197 (class 0 OID 0)
-- Dependencies: 211
-- Name: feederline_feederlineid_seq; Type: SEQUENCE OWNED BY; Schema: config; Owner: postgres
--

ALTER SEQUENCE config.feederline_feederlineid_seq OWNED BY config.feederline.feederlineid;


--
-- TOC entry 206 (class 1259 OID 19607)
-- Name: gateway; Type: TABLE; Schema: config; Owner: postgres
--

CREATE TABLE config.gateway (
    gatewayid integer NOT NULL,
    plantid integer NOT NULL,
    make character varying(100) NOT NULL,
    model character varying(100) NOT NULL,
    active boolean DEFAULT true,
    creartedby character varying(100) NOT NULL,
    createddate timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    updatedby character varying(100),
    updateddate timestamp without time zone
);


ALTER TABLE config.gateway OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 19605)
-- Name: gateway_gatewayid_seq; Type: SEQUENCE; Schema: config; Owner: postgres
--

CREATE SEQUENCE config.gateway_gatewayid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE config.gateway_gatewayid_seq OWNER TO postgres;

--
-- TOC entry 4198 (class 0 OID 0)
-- Dependencies: 205
-- Name: gateway_gatewayid_seq; Type: SEQUENCE OWNED BY; Schema: config; Owner: postgres
--

ALTER SEQUENCE config.gateway_gatewayid_seq OWNED BY config.gateway.gatewayid;


--
-- TOC entry 202 (class 1259 OID 19574)
-- Name: location; Type: TABLE; Schema: config; Owner: postgres
--

CREATE TABLE config.location (
    locationid integer NOT NULL,
    clientid integer NOT NULL,
    locationname character varying(50) NOT NULL,
    address character varying(100) NOT NULL,
    state character varying(50) NOT NULL,
    country character varying(50) NOT NULL,
    zipcode character varying(50) NOT NULL,
    longitude character varying(50) NOT NULL,
    latitude character varying(50) NOT NULL,
    active boolean DEFAULT true,
    createdby character varying(100) NOT NULL,
    createddate timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    updatedby character varying(100),
    updateddate timestamp without time zone
);


ALTER TABLE config.location OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 19572)
-- Name: location_locationid_seq; Type: SEQUENCE; Schema: config; Owner: postgres
--

CREATE SEQUENCE config.location_locationid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE config.location_locationid_seq OWNER TO postgres;

--
-- TOC entry 4199 (class 0 OID 0)
-- Dependencies: 201
-- Name: location_locationid_seq; Type: SEQUENCE OWNED BY; Schema: config; Owner: postgres
--

ALTER SEQUENCE config.location_locationid_seq OWNED BY config.location.locationid;


--
-- TOC entry 204 (class 1259 OID 19587)
-- Name: plant; Type: TABLE; Schema: config; Owner: postgres
--

CREATE TABLE config.plant (
    plantid integer NOT NULL,
    locationid integer NOT NULL,
    clientid integer NOT NULL,
    plantname character varying(100) NOT NULL,
    pono character varying(50),
    longitude character varying(50) NOT NULL,
    latitude character varying(50) NOT NULL,
    businesstype character varying(50) NOT NULL,
    plantdetails character varying(50) NOT NULL,
    healthstatus character(1) DEFAULT 'G'::bpchar,
    active boolean DEFAULT true,
    assetgreencnt integer DEFAULT 0,
    assetyellowcnt integer DEFAULT 0,
    assetredcnt integer DEFAULT 0,
    alertcriticalcnt integer DEFAULT 0,
    alertmediumcnt integer DEFAULT 0,
    alertlowcnt integer DEFAULT 0,
    createdby character varying(100) NOT NULL,
    createddate timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    updatedby character varying(100),
    updateddate timestamp without time zone
);


ALTER TABLE config.plant OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 19585)
-- Name: plant_plantid_seq; Type: SEQUENCE; Schema: config; Owner: postgres
--

CREATE SEQUENCE config.plant_plantid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE config.plant_plantid_seq OWNER TO postgres;

--
-- TOC entry 4200 (class 0 OID 0)
-- Dependencies: 203
-- Name: plant_plantid_seq; Type: SEQUENCE OWNED BY; Schema: config; Owner: postgres
--

ALTER SEQUENCE config.plant_plantid_seq OWNED BY config.plant.plantid;


--
-- TOC entry 208 (class 1259 OID 19617)
-- Name: sensor; Type: TABLE; Schema: config; Owner: postgres
--

CREATE TABLE config.sensor (
    sensorid bigint NOT NULL,
    gatewayid integer NOT NULL,
    assetid integer NOT NULL,
    sensormake integer NOT NULL,
    sensormodel integer NOT NULL,
    active boolean DEFAULT true,
    creartedby character varying(100) NOT NULL,
    createddate timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    updatedby character varying(100),
    updateddate timestamp without time zone
);


ALTER TABLE config.sensor OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 19615)
-- Name: sensor_sensorid_seq; Type: SEQUENCE; Schema: config; Owner: postgres
--

CREATE SEQUENCE config.sensor_sensorid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE config.sensor_sensorid_seq OWNER TO postgres;

--
-- TOC entry 4201 (class 0 OID 0)
-- Dependencies: 207
-- Name: sensor_sensorid_seq; Type: SEQUENCE OWNED BY; Schema: config; Owner: postgres
--

ALTER SEQUENCE config.sensor_sensorid_seq OWNED BY config.sensor.sensorid;


--
-- TOC entry 214 (class 1259 OID 19667)
-- Name: switchboard; Type: TABLE; Schema: config; Owner: postgres
--

CREATE TABLE config.switchboard (
    switchboardid integer NOT NULL,
    feederlineid integer NOT NULL,
    zoneid integer NOT NULL,
    plantid integer NOT NULL,
    switchboardname character varying(100) NOT NULL,
    extraattributes json,
    series integer NOT NULL,
    active boolean DEFAULT true,
    healthstatus character(1) DEFAULT 'G'::bpchar,
    assetgreencnt integer DEFAULT 0,
    assetyellowcnt integer DEFAULT 0,
    assetredcnt integer DEFAULT 0,
    alertcriticalcnt integer DEFAULT 0,
    alertmediumcnt integer DEFAULT 0,
    alertlowcnt integer DEFAULT 0,
    creartedby character varying(100) NOT NULL,
    createddate timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    updatedby character varying(100),
    updateddate timestamp without time zone
);


ALTER TABLE config.switchboard OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 19665)
-- Name: switchboard_switchboardid_seq; Type: SEQUENCE; Schema: config; Owner: postgres
--

CREATE SEQUENCE config.switchboard_switchboardid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE config.switchboard_switchboardid_seq OWNER TO postgres;

--
-- TOC entry 4202 (class 0 OID 0)
-- Dependencies: 213
-- Name: switchboard_switchboardid_seq; Type: SEQUENCE OWNED BY; Schema: config; Owner: postgres
--

ALTER SEQUENCE config.switchboard_switchboardid_seq OWNED BY config.switchboard.switchboardid;


--
-- TOC entry 220 (class 1259 OID 19711)
-- Name: thresholddef; Type: TABLE; Schema: config; Owner: postgres
--

CREATE TABLE config.thresholddef (
    defid integer NOT NULL,
    thrtypeid integer NOT NULL,
    faulttypeid integer NOT NULL,
    assetid integer NOT NULL,
    thrvalue real NOT NULL,
    active boolean DEFAULT true,
    creartedby character varying(100) NOT NULL,
    createddate timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    updatedby character varying(100),
    updateddate timestamp without time zone
);


ALTER TABLE config.thresholddef OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 19709)
-- Name: thresholddef_defid_seq; Type: SEQUENCE; Schema: config; Owner: postgres
--

CREATE SEQUENCE config.thresholddef_defid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE config.thresholddef_defid_seq OWNER TO postgres;

--
-- TOC entry 4203 (class 0 OID 0)
-- Dependencies: 219
-- Name: thresholddef_defid_seq; Type: SEQUENCE OWNED BY; Schema: config; Owner: postgres
--

ALTER SEQUENCE config.thresholddef_defid_seq OWNED BY config.thresholddef.defid;


--
-- TOC entry 218 (class 1259 OID 19701)
-- Name: thresholdtype; Type: TABLE; Schema: config; Owner: postgres
--

CREATE TABLE config.thresholdtype (
    thresholdtypeid integer NOT NULL,
    thresholdname character varying(50) NOT NULL,
    active boolean DEFAULT true,
    creartedby character varying(100) NOT NULL,
    createddate timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    updatedby character varying(100),
    updateddate timestamp without time zone
);


ALTER TABLE config.thresholdtype OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 19699)
-- Name: thresholdtype_thresholdtypeid_seq; Type: SEQUENCE; Schema: config; Owner: postgres
--

CREATE SEQUENCE config.thresholdtype_thresholdtypeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE config.thresholdtype_thresholdtypeid_seq OWNER TO postgres;

--
-- TOC entry 4204 (class 0 OID 0)
-- Dependencies: 217
-- Name: thresholdtype_thresholdtypeid_seq; Type: SEQUENCE OWNED BY; Schema: config; Owner: postgres
--

ALTER SEQUENCE config.thresholdtype_thresholdtypeid_seq OWNED BY config.thresholdtype.thresholdtypeid;


--
-- TOC entry 210 (class 1259 OID 19627)
-- Name: zone; Type: TABLE; Schema: config; Owner: postgres
--

CREATE TABLE config.zone (
    zoneid integer NOT NULL,
    plantid integer NOT NULL,
    zonename character varying(100) NOT NULL,
    extraattributes json,
    active boolean DEFAULT true,
    healthstatus character(1) DEFAULT 'G'::bpchar,
    assetgreencnt integer DEFAULT 0,
    assetyellowcnt integer DEFAULT 0,
    assetredcnt integer DEFAULT 0,
    alertcriticalcnt integer DEFAULT 0,
    alertmediumcnt integer DEFAULT 0,
    alertlowcnt integer DEFAULT 0,
    creartedby character varying(100) NOT NULL,
    createddate timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    updatedby character varying(100),
    updateddate timestamp without time zone
);


ALTER TABLE config.zone OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 19625)
-- Name: zone_zoneid_seq; Type: SEQUENCE; Schema: config; Owner: postgres
--

CREATE SEQUENCE config.zone_zoneid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE config.zone_zoneid_seq OWNER TO postgres;

--
-- TOC entry 4205 (class 0 OID 0)
-- Dependencies: 209
-- Name: zone_zoneid_seq; Type: SEQUENCE OWNED BY; Schema: config; Owner: postgres
--

ALTER SEQUENCE config.zone_zoneid_seq OWNED BY config.zone.zoneid;


--
-- TOC entry 3975 (class 2604 OID 19690)
-- Name: asset assetid; Type: DEFAULT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY config.asset ALTER COLUMN assetid SET DEFAULT nextval('config.asset_assetid_seq'::regclass);


--
-- TOC entry 3991 (class 2604 OID 19744)
-- Name: bindefinition bindefid; Type: DEFAULT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY config.bindefinition ALTER COLUMN bindefid SET DEFAULT nextval('config.bindefinition_bindefid_seq'::regclass);


--
-- TOC entry 3988 (class 2604 OID 19734)
-- Name: bintype bintypeid; Type: DEFAULT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY config.bintype ALTER COLUMN bintypeid SET DEFAULT nextval('config.bintype_bintypeid_seq'::regclass);


--
-- TOC entry 3922 (class 2604 OID 19563)
-- Name: client clientid; Type: DEFAULT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY config.client ALTER COLUMN clientid SET DEFAULT nextval('config.client_clientid_seq'::regclass);


--
-- TOC entry 3997 (class 2604 OID 19764)
-- Name: faultdefinition faultdefid; Type: DEFAULT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY config.faultdefinition ALTER COLUMN faultdefid SET DEFAULT nextval('config.faultdefinition_faultdefid_seq'::regclass);


--
-- TOC entry 3994 (class 2604 OID 19754)
-- Name: faultdeftypes faultdeftypeid; Type: DEFAULT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY config.faultdeftypes ALTER COLUMN faultdeftypeid SET DEFAULT nextval('config.faultdeftypes_faultdeftypeid_seq'::regclass);


--
-- TOC entry 3985 (class 2604 OID 19724)
-- Name: faulttype faulttypeid; Type: DEFAULT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY config.faulttype ALTER COLUMN faulttypeid SET DEFAULT nextval('config.faulttype_faulttypeid_seq'::regclass);


--
-- TOC entry 3955 (class 2604 OID 19650)
-- Name: feederline feederlineid; Type: DEFAULT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY config.feederline ALTER COLUMN feederlineid SET DEFAULT nextval('config.feederline_feederlineid_seq'::regclass);


--
-- TOC entry 3939 (class 2604 OID 19610)
-- Name: gateway gatewayid; Type: DEFAULT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY config.gateway ALTER COLUMN gatewayid SET DEFAULT nextval('config.gateway_gatewayid_seq'::regclass);


--
-- TOC entry 3926 (class 2604 OID 19577)
-- Name: location locationid; Type: DEFAULT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY config.location ALTER COLUMN locationid SET DEFAULT nextval('config.location_locationid_seq'::regclass);


--
-- TOC entry 3929 (class 2604 OID 19590)
-- Name: plant plantid; Type: DEFAULT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY config.plant ALTER COLUMN plantid SET DEFAULT nextval('config.plant_plantid_seq'::regclass);


--
-- TOC entry 3942 (class 2604 OID 19620)
-- Name: sensor sensorid; Type: DEFAULT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY config.sensor ALTER COLUMN sensorid SET DEFAULT nextval('config.sensor_sensorid_seq'::regclass);


--
-- TOC entry 3965 (class 2604 OID 19670)
-- Name: switchboard switchboardid; Type: DEFAULT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY config.switchboard ALTER COLUMN switchboardid SET DEFAULT nextval('config.switchboard_switchboardid_seq'::regclass);


--
-- TOC entry 3982 (class 2604 OID 19714)
-- Name: thresholddef defid; Type: DEFAULT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY config.thresholddef ALTER COLUMN defid SET DEFAULT nextval('config.thresholddef_defid_seq'::regclass);


--
-- TOC entry 3979 (class 2604 OID 19704)
-- Name: thresholdtype thresholdtypeid; Type: DEFAULT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY config.thresholdtype ALTER COLUMN thresholdtypeid SET DEFAULT nextval('config.thresholdtype_thresholdtypeid_seq'::regclass);


--
-- TOC entry 3945 (class 2604 OID 19630)
-- Name: zone zoneid; Type: DEFAULT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY config.zone ALTER COLUMN zoneid SET DEFAULT nextval('config.zone_zoneid_seq'::regclass);


--
-- TOC entry 4170 (class 0 OID 19687)
-- Dependencies: 216
-- Data for Name: asset; Type: TABLE DATA; Schema: config; Owner: postgres
--

COPY config.asset (assetid, switchboardid, feederlineid, zoneid, plantid, category, type, assetmodelno, extraattributes, healthstatus, active, creartedby, createddate, updatedby, updateddate) FROM stdin;
\.


--
-- TOC entry 4180 (class 0 OID 19741)
-- Dependencies: 226
-- Data for Name: bindefinition; Type: TABLE DATA; Schema: config; Owner: postgres
--

COPY config.bindefinition (bindefid, assetid, bintypeid, binstart, binstop, binwidth, active, creartedby, createddate, updatedby, updateddate) FROM stdin;
\.


--
-- TOC entry 4178 (class 0 OID 19731)
-- Dependencies: 224
-- Data for Name: bintype; Type: TABLE DATA; Schema: config; Owner: postgres
--

COPY config.bintype (bintypeid, bintypename, active, creartedby, createddate, updatedby, updateddate) FROM stdin;
\.


--
-- TOC entry 4154 (class 0 OID 19560)
-- Dependencies: 200
-- Data for Name: client; Type: TABLE DATA; Schema: config; Owner: postgres
--

COPY config.client (clientid, clientname, contactname, contactphone, contactemail, address, bucketdetails, healthstatus, active, createdby, createddate, updatedby, updateddate) FROM stdin;
\.


--
-- TOC entry 4184 (class 0 OID 19761)
-- Dependencies: 230
-- Data for Name: faultdefinition; Type: TABLE DATA; Schema: config; Owner: postgres
--

COPY config.faultdefinition (faultdefid, assetid, faulttypeid, faultdeftypeid, faultvalue, active, creartedby, createddate, updatedby, updateddate) FROM stdin;
\.


--
-- TOC entry 4182 (class 0 OID 19751)
-- Dependencies: 228
-- Data for Name: faultdeftypes; Type: TABLE DATA; Schema: config; Owner: postgres
--

COPY config.faultdeftypes (faultdeftypeid, faultdeftypname, active, creartedby, createddate, updatedby, updateddate) FROM stdin;
\.


--
-- TOC entry 4176 (class 0 OID 19721)
-- Dependencies: 222
-- Data for Name: faulttype; Type: TABLE DATA; Schema: config; Owner: postgres
--

COPY config.faulttype (faulttypeid, faultname, active, creartedby, createddate, updatedby, updateddate) FROM stdin;
\.


--
-- TOC entry 4166 (class 0 OID 19647)
-- Dependencies: 212
-- Data for Name: feederline; Type: TABLE DATA; Schema: config; Owner: postgres
--

COPY config.feederline (feederlineid, zoneid, plantid, feedername, extraattributes, active, healthstatus, assetgreencnt, assetyellowcnt, assetredcnt, alertcriticalcnt, alertmediumcnt, alertlowcnt, creartedby, createddate, updatedby, updateddate) FROM stdin;
1	2	1	3.3kV	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:50:56.327813	\N	\N
2	2	1	1.0kV	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:51:14.546355	\N	\N
3	2	1	11kV	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:51:19.766794	\N	\N
4	2	1	400 V	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:52:00.358461	\N	\N
5	2	1	6.6 kV	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:52:12.668705	\N	\N
6	3	1	11 kV	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:53:37.400519	\N	\N
7	3	1	6.6 kV	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:53:37.400519	\N	\N
8	3	1	3.3 kV	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:53:37.400519	\N	\N
9	3	1	400 V	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:53:37.400519	\N	\N
10	4	1	6.6 kV	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:54:01.493489	\N	\N
11	4	1	3.3 kV	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:54:01.493489	\N	\N
12	5	1	11 kV	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:54:10.317201	\N	\N
13	5	1	6.6 kV	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:54:10.317201	\N	\N
14	5	1	3.3 kV	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:54:10.317201	\N	\N
15	7	2	11 kV	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:54:56.143789	\N	\N
16	7	2	6.6 kV	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:54:56.143789	\N	\N
17	7	2	3.3 kV	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:54:56.143789	\N	\N
18	7	2	400 V	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:54:56.143789	\N	\N
19	8	2	11 kV	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:55:24.913541	\N	\N
20	8	2	6.6 kV	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:55:24.913541	\N	\N
21	12	3	6.6 kV	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:56:29.311221	\N	\N
22	12	3	3.3 kV	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:56:29.311221	\N	\N
23	12	3	400 V	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:56:29.311221	\N	\N
24	13	3	11 kV	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:56:41.935195	\N	\N
25	13	3	6.6 kV	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:56:41.935195	\N	\N
26	13	3	3.3 kV	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:56:41.935195	\N	\N
\.


--
-- TOC entry 4160 (class 0 OID 19607)
-- Dependencies: 206
-- Data for Name: gateway; Type: TABLE DATA; Schema: config; Owner: postgres
--

COPY config.gateway (gatewayid, plantid, make, model, active, creartedby, createddate, updatedby, updateddate) FROM stdin;
\.


--
-- TOC entry 4156 (class 0 OID 19574)
-- Dependencies: 202
-- Data for Name: location; Type: TABLE DATA; Schema: config; Owner: postgres
--

COPY config.location (locationid, clientid, locationname, address, state, country, zipcode, longitude, latitude, active, createdby, createddate, updatedby, updateddate) FROM stdin;
\.


--
-- TOC entry 4158 (class 0 OID 19587)
-- Dependencies: 204
-- Data for Name: plant; Type: TABLE DATA; Schema: config; Owner: postgres
--

COPY config.plant (plantid, locationid, clientid, plantname, pono, longitude, latitude, businesstype, plantdetails, healthstatus, active, assetgreencnt, assetyellowcnt, assetredcnt, alertcriticalcnt, alertmediumcnt, alertlowcnt, createdby, createddate, updatedby, updateddate) FROM stdin;
1	1	1	Plant311	PO-8765-C42	84.32322	66.32322	PG	Nlr	H	t	0	0	0	0	0	0	nanarah	2020-02-03 17:07:10.350441	\N	\N
2	1	1	Plant312	PO-8765-C52	84.32322	66.32322	PG	Nlr	H	t	0	0	0	0	0	0	nanarah	2020-02-03 17:07:18.854431	\N	\N
3	2	1	Plant323	PO-8765-A52	84.32322	66.32322	PG	Nlr	H	t	0	0	0	0	0	0	nanarah	2020-02-03 17:07:34.951862	\N	\N
\.


--
-- TOC entry 4162 (class 0 OID 19617)
-- Dependencies: 208
-- Data for Name: sensor; Type: TABLE DATA; Schema: config; Owner: postgres
--

COPY config.sensor (sensorid, gatewayid, assetid, sensormake, sensormodel, active, creartedby, createddate, updatedby, updateddate) FROM stdin;
\.


--
-- TOC entry 4168 (class 0 OID 19667)
-- Dependencies: 214
-- Data for Name: switchboard; Type: TABLE DATA; Schema: config; Owner: postgres
--

COPY config.switchboard (switchboardid, feederlineid, zoneid, plantid, switchboardname, extraattributes, series, active, healthstatus, assetgreencnt, assetyellowcnt, assetredcnt, alertcriticalcnt, alertmediumcnt, alertlowcnt, creartedby, createddate, updatedby, updateddate) FROM stdin;
1	1	2	1	SB-121-1	\N	1	t	G	0	0	0	0	0	0	nanarah	2020-02-04 12:17:17.03677	\N	\N
2	1	2	1	SB-121-2	\N	1	t	G	0	0	0	0	0	0	nanarah	2020-02-04 12:38:09.983234	\N	\N
3	1	2	1	SB-121-3	\N	2	t	G	0	0	0	0	0	0	nanarah	2020-02-04 12:38:24.022121	\N	\N
4	1	2	1	SB-121-4	\N	2	t	G	0	0	0	0	0	0	nanarah	2020-02-04 12:38:31.539352	\N	\N
5	2	2	1	SB-221-1	\N	1	t	G	0	0	0	0	0	0	nanarah	2020-02-04 12:38:59.009434	\N	\N
6	2	2	1	SB-221-2	\N	1	t	G	0	0	0	0	0	0	nanarah	2020-02-04 12:39:04.433348	\N	\N
7	2	2	1	SB-221-3	\N	1	t	G	0	0	0	0	0	0	nanarah	2020-02-04 12:39:09.904904	\N	\N
8	2	2	1	SB-221-4	\N	2	t	G	0	0	0	0	0	0	nanarah	2020-02-04 12:39:19.293978	\N	\N
9	2	2	1	SB-221-5	\N	2	t	G	0	0	0	0	0	0	nanarah	2020-02-04 12:39:25.633985	\N	\N
10	3	2	1	SB-321-1	\N	1	t	G	0	0	0	0	0	0	nanarah	2020-02-04 12:40:29.856534	\N	\N
11	3	2	1	SB-321-2	\N	1	t	G	0	0	0	0	0	0	nanarah	2020-02-04 12:40:37.418607	\N	\N
12	3	2	1	SB-321-3	\N	2	t	G	0	0	0	0	0	0	nanarah	2020-02-04 12:40:46.669007	\N	\N
13	4	2	1	SB-421-1	\N	1	t	G	0	0	0	0	0	0	nanarah	2020-02-04 12:41:29.26149	\N	\N
14	4	2	1	SB-421-2	\N	1	t	G	0	0	0	0	0	0	nanarah	2020-02-04 12:41:37.047091	\N	\N
15	4	2	1	SB-421-3	\N	1	t	G	0	0	0	0	0	0	nanarah	2020-02-04 12:41:43.49465	\N	\N
16	4	2	1	SB-421-4	\N	2	t	G	0	0	0	0	0	0	nanarah	2020-02-04 12:41:51.513954	\N	\N
17	4	2	1	SB-421-5	\N	2	t	G	0	0	0	0	0	0	nanarah	2020-02-04 12:41:56.785886	\N	\N
18	4	2	1	SB-421-6	\N	3	t	G	0	0	0	0	0	0	nanarah	2020-02-04 12:42:04.286125	\N	\N
19	4	2	1	SB-421-7	\N	3	t	G	0	0	0	0	0	0	nanarah	2020-02-04 12:42:09.817212	\N	\N
20	15	7	2	SB-1572-1	\N	1	t	G	0	0	0	0	0	0	nanarah	2020-02-04 12:42:41.478546	\N	\N
21	15	7	2	SB-1572-2	\N	1	t	G	0	0	0	0	0	0	nanarah	2020-02-04 12:42:48.065406	\N	\N
22	15	7	2	SB-1572-3	\N	2	t	G	0	0	0	0	0	0	nanarah	2020-02-04 12:42:56.971147	\N	\N
23	16	7	2	SB-16-72-1	\N	1	t	G	0	0	0	0	0	0	nanarah	2020-02-04 12:43:14.72957	\N	\N
24	16	7	2	SB-16-72-2	\N	1	t	G	0	0	0	0	0	0	nanarah	2020-02-04 12:43:22.060473	\N	\N
25	16	7	2	SB-16-72-3	\N	1	t	G	0	0	0	0	0	0	nanarah	2020-02-04 12:43:27.291761	\N	\N
26	19	8	2	SB-19-82-1	\N	1	t	G	0	0	0	0	0	0	nanarah	2020-02-04 12:43:51.672134	\N	\N
27	19	8	2	SB-19-82-2	\N	2	t	G	0	0	0	0	0	0	nanarah	2020-02-04 12:43:59.282034	\N	\N
28	20	8	2	SB-20-82-1	\N	2	t	G	0	0	0	0	0	0	nanarah	2020-02-04 12:44:12.056483	\N	\N
29	20	8	2	SB-20-82-2	\N	2	t	G	0	0	0	0	0	0	nanarah	2020-02-04 12:44:20.137222	\N	\N
30	20	8	2	SB-20-82-3	\N	3	t	G	0	0	0	0	0	0	nanarah	2020-02-04 12:44:30.725425	\N	\N
31	20	8	2	SB-20-82-4	\N	3	t	G	0	0	0	0	0	0	nanarah	2020-02-04 12:44:37.596226	\N	\N
\.


--
-- TOC entry 4174 (class 0 OID 19711)
-- Dependencies: 220
-- Data for Name: thresholddef; Type: TABLE DATA; Schema: config; Owner: postgres
--

COPY config.thresholddef (defid, thrtypeid, faulttypeid, assetid, thrvalue, active, creartedby, createddate, updatedby, updateddate) FROM stdin;
\.


--
-- TOC entry 4172 (class 0 OID 19701)
-- Dependencies: 218
-- Data for Name: thresholdtype; Type: TABLE DATA; Schema: config; Owner: postgres
--

COPY config.thresholdtype (thresholdtypeid, thresholdname, active, creartedby, createddate, updatedby, updateddate) FROM stdin;
\.


--
-- TOC entry 4164 (class 0 OID 19627)
-- Dependencies: 210
-- Data for Name: zone; Type: TABLE DATA; Schema: config; Owner: postgres
--

COPY config.zone (zoneid, plantid, zonename, extraattributes, active, healthstatus, assetgreencnt, assetyellowcnt, assetredcnt, alertcriticalcnt, alertmediumcnt, alertlowcnt, creartedby, createddate, updatedby, updateddate) FROM stdin;
1	1	0A	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:45:03.986066	\N	\N
2	1	1A	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:45:03.986166	\N	\N
3	1	2A	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:45:17.415918	\N	\N
4	1	3A	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:45:24.788832	\N	\N
5	1	1B	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:45:37.520522	\N	\N
6	1	2B	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:45:48.157332	\N	\N
7	2	2A	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:45:58.493703	\N	\N
8	2	3A	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:46:03.47752	\N	\N
9	2	1B	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:46:09.214808	\N	\N
10	2	2B	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:46:14.165886	\N	\N
11	2	3B	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:46:18.57852	\N	\N
12	3	1A	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:46:25.75405	\N	\N
13	3	3A	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:46:30.61926	\N	\N
14	3	1B	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:46:37.739779	\N	\N
15	3	2B	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:46:41.993896	\N	\N
16	3	3B	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:46:49.482796	\N	\N
17	3	4B	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:46:54.236206	\N	\N
18	3	1C	\N	t	G	0	0	0	0	0	0	nanarah	2020-02-04 11:47:00.971639	\N	\N
\.


--
-- TOC entry 4206 (class 0 OID 0)
-- Dependencies: 215
-- Name: asset_assetid_seq; Type: SEQUENCE SET; Schema: config; Owner: postgres
--

SELECT pg_catalog.setval('config.asset_assetid_seq', 1, false);


--
-- TOC entry 4207 (class 0 OID 0)
-- Dependencies: 225
-- Name: bindefinition_bindefid_seq; Type: SEQUENCE SET; Schema: config; Owner: postgres
--

SELECT pg_catalog.setval('config.bindefinition_bindefid_seq', 1, false);


--
-- TOC entry 4208 (class 0 OID 0)
-- Dependencies: 223
-- Name: bintype_bintypeid_seq; Type: SEQUENCE SET; Schema: config; Owner: postgres
--

SELECT pg_catalog.setval('config.bintype_bintypeid_seq', 1, false);


--
-- TOC entry 4209 (class 0 OID 0)
-- Dependencies: 199
-- Name: client_clientid_seq; Type: SEQUENCE SET; Schema: config; Owner: postgres
--

SELECT pg_catalog.setval('config.client_clientid_seq', 1, false);


--
-- TOC entry 4210 (class 0 OID 0)
-- Dependencies: 229
-- Name: faultdefinition_faultdefid_seq; Type: SEQUENCE SET; Schema: config; Owner: postgres
--

SELECT pg_catalog.setval('config.faultdefinition_faultdefid_seq', 1, false);


--
-- TOC entry 4211 (class 0 OID 0)
-- Dependencies: 227
-- Name: faultdeftypes_faultdeftypeid_seq; Type: SEQUENCE SET; Schema: config; Owner: postgres
--

SELECT pg_catalog.setval('config.faultdeftypes_faultdeftypeid_seq', 1, false);


--
-- TOC entry 4212 (class 0 OID 0)
-- Dependencies: 221
-- Name: faulttype_faulttypeid_seq; Type: SEQUENCE SET; Schema: config; Owner: postgres
--

SELECT pg_catalog.setval('config.faulttype_faulttypeid_seq', 1, false);


--
-- TOC entry 4213 (class 0 OID 0)
-- Dependencies: 211
-- Name: feederline_feederlineid_seq; Type: SEQUENCE SET; Schema: config; Owner: postgres
--

SELECT pg_catalog.setval('config.feederline_feederlineid_seq', 1, false);


--
-- TOC entry 4214 (class 0 OID 0)
-- Dependencies: 205
-- Name: gateway_gatewayid_seq; Type: SEQUENCE SET; Schema: config; Owner: postgres
--

SELECT pg_catalog.setval('config.gateway_gatewayid_seq', 1, false);


--
-- TOC entry 4215 (class 0 OID 0)
-- Dependencies: 201
-- Name: location_locationid_seq; Type: SEQUENCE SET; Schema: config; Owner: postgres
--

SELECT pg_catalog.setval('config.location_locationid_seq', 1, false);


--
-- TOC entry 4216 (class 0 OID 0)
-- Dependencies: 203
-- Name: plant_plantid_seq; Type: SEQUENCE SET; Schema: config; Owner: postgres
--

SELECT pg_catalog.setval('config.plant_plantid_seq', 1, false);


--
-- TOC entry 4217 (class 0 OID 0)
-- Dependencies: 207
-- Name: sensor_sensorid_seq; Type: SEQUENCE SET; Schema: config; Owner: postgres
--

SELECT pg_catalog.setval('config.sensor_sensorid_seq', 1, false);


--
-- TOC entry 4218 (class 0 OID 0)
-- Dependencies: 213
-- Name: switchboard_switchboardid_seq; Type: SEQUENCE SET; Schema: config; Owner: postgres
--

SELECT pg_catalog.setval('config.switchboard_switchboardid_seq', 1, false);


--
-- TOC entry 4219 (class 0 OID 0)
-- Dependencies: 219
-- Name: thresholddef_defid_seq; Type: SEQUENCE SET; Schema: config; Owner: postgres
--

SELECT pg_catalog.setval('config.thresholddef_defid_seq', 1, false);


--
-- TOC entry 4220 (class 0 OID 0)
-- Dependencies: 217
-- Name: thresholdtype_thresholdtypeid_seq; Type: SEQUENCE SET; Schema: config; Owner: postgres
--

SELECT pg_catalog.setval('config.thresholdtype_thresholdtypeid_seq', 1, false);


--
-- TOC entry 4221 (class 0 OID 0)
-- Dependencies: 209
-- Name: zone_zoneid_seq; Type: SEQUENCE SET; Schema: config; Owner: postgres
--

SELECT pg_catalog.setval('config.zone_zoneid_seq', 1, false);


--
-- TOC entry 4017 (class 2606 OID 19698)
-- Name: asset asset_pkey; Type: CONSTRAINT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY config.asset
    ADD CONSTRAINT asset_pkey PRIMARY KEY (assetid);


--
-- TOC entry 4027 (class 2606 OID 19748)
-- Name: bindefinition bindefinition_pkey; Type: CONSTRAINT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY config.bindefinition
    ADD CONSTRAINT bindefinition_pkey PRIMARY KEY (bindefid);


--
-- TOC entry 4025 (class 2606 OID 19738)
-- Name: bintype bintype_pkey; Type: CONSTRAINT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY config.bintype
    ADD CONSTRAINT bintype_pkey PRIMARY KEY (bintypeid);


--
-- TOC entry 4001 (class 2606 OID 19571)
-- Name: client client_pkey; Type: CONSTRAINT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY config.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (clientid);


--
-- TOC entry 4031 (class 2606 OID 19768)
-- Name: faultdefinition faultdefinition_pkey; Type: CONSTRAINT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY config.faultdefinition
    ADD CONSTRAINT faultdefinition_pkey PRIMARY KEY (faultdefid);


--
-- TOC entry 4029 (class 2606 OID 19758)
-- Name: faultdeftypes faultdeftypes_pkey; Type: CONSTRAINT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY config.faultdeftypes
    ADD CONSTRAINT faultdeftypes_pkey PRIMARY KEY (faultdeftypeid);


--
-- TOC entry 4023 (class 2606 OID 19728)
-- Name: faulttype faulttype_pkey; Type: CONSTRAINT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY config.faulttype
    ADD CONSTRAINT faulttype_pkey PRIMARY KEY (faulttypeid);


--
-- TOC entry 4013 (class 2606 OID 19664)
-- Name: feederline feederline_pkey; Type: CONSTRAINT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY config.feederline
    ADD CONSTRAINT feederline_pkey PRIMARY KEY (feederlineid);


--
-- TOC entry 4007 (class 2606 OID 19614)
-- Name: gateway gateway_pkey; Type: CONSTRAINT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY config.gateway
    ADD CONSTRAINT gateway_pkey PRIMARY KEY (gatewayid);


--
-- TOC entry 4003 (class 2606 OID 19584)
-- Name: location location_pkey; Type: CONSTRAINT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY config.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (locationid);


--
-- TOC entry 4005 (class 2606 OID 19604)
-- Name: plant plant_pkey; Type: CONSTRAINT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY config.plant
    ADD CONSTRAINT plant_pkey PRIMARY KEY (plantid);


--
-- TOC entry 4009 (class 2606 OID 19624)
-- Name: sensor sensor_pkey; Type: CONSTRAINT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY config.sensor
    ADD CONSTRAINT sensor_pkey PRIMARY KEY (sensorid);


--
-- TOC entry 4015 (class 2606 OID 19684)
-- Name: switchboard switchboard_pkey; Type: CONSTRAINT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY config.switchboard
    ADD CONSTRAINT switchboard_pkey PRIMARY KEY (switchboardid);


--
-- TOC entry 4021 (class 2606 OID 19718)
-- Name: thresholddef thresholddef_pkey; Type: CONSTRAINT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY config.thresholddef
    ADD CONSTRAINT thresholddef_pkey PRIMARY KEY (defid);


--
-- TOC entry 4019 (class 2606 OID 19708)
-- Name: thresholdtype thresholdtype_pkey; Type: CONSTRAINT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY config.thresholdtype
    ADD CONSTRAINT thresholdtype_pkey PRIMARY KEY (thresholdtypeid);


--
-- TOC entry 4011 (class 2606 OID 19644)
-- Name: zone zone_pkey; Type: CONSTRAINT; Schema: config; Owner: postgres
--

ALTER TABLE ONLY config.zone
    ADD CONSTRAINT zone_pkey PRIMARY KEY (zoneid);


-- Completed on 2020-02-07 08:29:49

--
-- PostgreSQL database dump complete
--

