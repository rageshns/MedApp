--
-- PostgreSQL database dump
--

-- Dumped from database version 10.7
-- Dumped by pg_dump version 12.0

-- Started on 2020-02-07 08:55:02

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
-- TOC entry 4 (class 2615 OID 19769)
-- Name: health; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA health;


ALTER SCHEMA health OWNER TO postgres;

SET default_tablespace = '';

--
-- TOC entry 234 (class 1259 OID 19784)
-- Name: assetalertmgmt; Type: TABLE; Schema: health; Owner: postgres
--

CREATE TABLE health.assetalertmgmt (
    alertid bigint NOT NULL,
    assetid integer NOT NULL,
    jobid integer NOT NULL,
    message character varying(100) NOT NULL,
    state character varying(50) NOT NULL,
    statusproposed character varying(50) NOT NULL,
    statusapproved character varying(50) NOT NULL,
    creartedby character varying(100) NOT NULL,
    createddate timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    updatedby character varying(100),
    updateddate timestamp without time zone
);


ALTER TABLE health.assetalertmgmt OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 19782)
-- Name: assetalertmgmt_alertid_seq; Type: SEQUENCE; Schema: health; Owner: postgres
--

CREATE SEQUENCE health.assetalertmgmt_alertid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE health.assetalertmgmt_alertid_seq OWNER TO postgres;

--
-- TOC entry 4066 (class 0 OID 0)
-- Dependencies: 233
-- Name: assetalertmgmt_alertid_seq; Type: SEQUENCE OWNED BY; Schema: health; Owner: postgres
--

ALTER SEQUENCE health.assetalertmgmt_alertid_seq OWNED BY health.assetalertmgmt.alertid;


--
-- TOC entry 238 (class 1259 OID 19802)
-- Name: assethealthbin; Type: TABLE; Schema: health; Owner: postgres
--

CREATE TABLE health.assethealthbin (
    healthbinid bigint NOT NULL,
    healthid bigint NOT NULL,
    bindefid integer NOT NULL,
    creartedby character varying(100) NOT NULL,
    createddate timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    updatedby character varying(100),
    updateddate timestamp without time zone
);


ALTER TABLE health.assethealthbin OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 19800)
-- Name: assethealthbin_healthbinid_seq; Type: SEQUENCE; Schema: health; Owner: postgres
--

CREATE SEQUENCE health.assethealthbin_healthbinid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE health.assethealthbin_healthbinid_seq OWNER TO postgres;

--
-- TOC entry 4067 (class 0 OID 0)
-- Dependencies: 237
-- Name: assethealthbin_healthbinid_seq; Type: SEQUENCE OWNED BY; Schema: health; Owner: postgres
--

ALTER SEQUENCE health.assethealthbin_healthbinid_seq OWNED BY health.assethealthbin.healthbinid;


--
-- TOC entry 236 (class 1259 OID 19793)
-- Name: assethealthmgmt; Type: TABLE; Schema: health; Owner: postgres
--

CREATE TABLE health.assethealthmgmt (
    healthid bigint NOT NULL,
    assetid integer NOT NULL,
    jobid integer NOT NULL,
    frequency integer NOT NULL,
    load integer NOT NULL,
    speed integer NOT NULL,
    unbalance integer NOT NULL,
    faulttypeid integer NOT NULL,
    faultindexvalue integer NOT NULL,
    statusproposed character varying(50) NOT NULL,
    statusprevious character varying(50) NOT NULL,
    statusapproved character varying(50) NOT NULL,
    creartedby character varying(100) NOT NULL,
    createddate timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    updatedby character varying(100),
    updateddate timestamp without time zone
);


ALTER TABLE health.assethealthmgmt OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 19791)
-- Name: assethealthmgmt_healthid_seq; Type: SEQUENCE; Schema: health; Owner: postgres
--

CREATE SEQUENCE health.assethealthmgmt_healthid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE health.assethealthmgmt_healthid_seq OWNER TO postgres;

--
-- TOC entry 4068 (class 0 OID 0)
-- Dependencies: 235
-- Name: assethealthmgmt_healthid_seq; Type: SEQUENCE OWNED BY; Schema: health; Owner: postgres
--

ALTER SEQUENCE health.assethealthmgmt_healthid_seq OWNED BY health.assethealthmgmt.healthid;


--
-- TOC entry 232 (class 1259 OID 19772)
-- Name: jobcontrol; Type: TABLE; Schema: health; Owner: postgres
--

CREATE TABLE health.jobcontrol (
    jobid integer NOT NULL,
    plantid integer NOT NULL,
    gatewayid integer NOT NULL,
    processname character varying(100) NOT NULL,
    startdatetime timestamp without time zone NOT NULL,
    enddatetime timestamp without time zone NOT NULL,
    statuscode character varying(1) NOT NULL,
    failurereason character varying(200) NOT NULL,
    sourcesystem character varying(50) NOT NULL,
    creartedby character varying(100) NOT NULL,
    createddate timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    updatedby character varying(100),
    updateddate timestamp without time zone
);


ALTER TABLE health.jobcontrol OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 19770)
-- Name: jobcontrol_jobid_seq; Type: SEQUENCE; Schema: health; Owner: postgres
--

CREATE SEQUENCE health.jobcontrol_jobid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE health.jobcontrol_jobid_seq OWNER TO postgres;

--
-- TOC entry 4069 (class 0 OID 0)
-- Dependencies: 231
-- Name: jobcontrol_jobid_seq; Type: SEQUENCE OWNED BY; Schema: health; Owner: postgres
--

ALTER SEQUENCE health.jobcontrol_jobid_seq OWNED BY health.jobcontrol.jobid;


--
-- TOC entry 240 (class 1259 OID 19813)
-- Name: userassetfav; Type: TABLE; Schema: health; Owner: postgres
--

CREATE TABLE health.userassetfav (
    userid character varying(100) NOT NULL,
    assetid integer NOT NULL,
    creartedby character varying(100) NOT NULL,
    createddate timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    updatedby character varying(100),
    updateddate timestamp without time zone
);


ALTER TABLE health.userassetfav OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 19809)
-- Name: userlog; Type: TABLE; Schema: health; Owner: postgres
--

CREATE TABLE health.userlog (
    userid character varying(100) NOT NULL,
    lastlogin timestamp without time zone NOT NULL,
    lastlogout timestamp without time zone NOT NULL,
    creartedby character varying(100) NOT NULL,
    createddate timestamp without time zone DEFAULT (CURRENT_TIMESTAMP)::timestamp without time zone,
    updatedby character varying(100),
    updateddate timestamp without time zone
);


ALTER TABLE health.userlog OWNER TO postgres;

--
-- TOC entry 3914 (class 2604 OID 19787)
-- Name: assetalertmgmt alertid; Type: DEFAULT; Schema: health; Owner: postgres
--

ALTER TABLE ONLY health.assetalertmgmt ALTER COLUMN alertid SET DEFAULT nextval('health.assetalertmgmt_alertid_seq'::regclass);


--
-- TOC entry 3918 (class 2604 OID 19805)
-- Name: assethealthbin healthbinid; Type: DEFAULT; Schema: health; Owner: postgres
--

ALTER TABLE ONLY health.assethealthbin ALTER COLUMN healthbinid SET DEFAULT nextval('health.assethealthbin_healthbinid_seq'::regclass);


--
-- TOC entry 3916 (class 2604 OID 19796)
-- Name: assethealthmgmt healthid; Type: DEFAULT; Schema: health; Owner: postgres
--

ALTER TABLE ONLY health.assethealthmgmt ALTER COLUMN healthid SET DEFAULT nextval('health.assethealthmgmt_healthid_seq'::regclass);


--
-- TOC entry 3912 (class 2604 OID 19775)
-- Name: jobcontrol jobid; Type: DEFAULT; Schema: health; Owner: postgres
--

ALTER TABLE ONLY health.jobcontrol ALTER COLUMN jobid SET DEFAULT nextval('health.jobcontrol_jobid_seq'::regclass);


--
-- TOC entry 4054 (class 0 OID 19784)
-- Dependencies: 234
-- Data for Name: assetalertmgmt; Type: TABLE DATA; Schema: health; Owner: postgres
--

COPY health.assetalertmgmt (alertid, assetid, jobid, message, state, statusproposed, statusapproved, creartedby, createddate, updatedby, updateddate) FROM stdin;
\.


--
-- TOC entry 4058 (class 0 OID 19802)
-- Dependencies: 238
-- Data for Name: assethealthbin; Type: TABLE DATA; Schema: health; Owner: postgres
--

COPY health.assethealthbin (healthbinid, healthid, bindefid, creartedby, createddate, updatedby, updateddate) FROM stdin;
\.


--
-- TOC entry 4056 (class 0 OID 19793)
-- Dependencies: 236
-- Data for Name: assethealthmgmt; Type: TABLE DATA; Schema: health; Owner: postgres
--

COPY health.assethealthmgmt (healthid, assetid, jobid, frequency, load, speed, unbalance, faulttypeid, faultindexvalue, statusproposed, statusprevious, statusapproved, creartedby, createddate, updatedby, updateddate) FROM stdin;
\.


--
-- TOC entry 4052 (class 0 OID 19772)
-- Dependencies: 232
-- Data for Name: jobcontrol; Type: TABLE DATA; Schema: health; Owner: postgres
--

COPY health.jobcontrol (jobid, plantid, gatewayid, processname, startdatetime, enddatetime, statuscode, failurereason, sourcesystem, creartedby, createddate, updatedby, updateddate) FROM stdin;
\.


--
-- TOC entry 4060 (class 0 OID 19813)
-- Dependencies: 240
-- Data for Name: userassetfav; Type: TABLE DATA; Schema: health; Owner: postgres
--

COPY health.userassetfav (userid, assetid, creartedby, createddate, updatedby, updateddate) FROM stdin;
\.


--
-- TOC entry 4059 (class 0 OID 19809)
-- Dependencies: 239
-- Data for Name: userlog; Type: TABLE DATA; Schema: health; Owner: postgres
--

COPY health.userlog (userid, lastlogin, lastlogout, creartedby, createddate, updatedby, updateddate) FROM stdin;
\.


--
-- TOC entry 4070 (class 0 OID 0)
-- Dependencies: 233
-- Name: assetalertmgmt_alertid_seq; Type: SEQUENCE SET; Schema: health; Owner: postgres
--

SELECT pg_catalog.setval('health.assetalertmgmt_alertid_seq', 1, false);


--
-- TOC entry 4071 (class 0 OID 0)
-- Dependencies: 237
-- Name: assethealthbin_healthbinid_seq; Type: SEQUENCE SET; Schema: health; Owner: postgres
--

SELECT pg_catalog.setval('health.assethealthbin_healthbinid_seq', 1, false);


--
-- TOC entry 4072 (class 0 OID 0)
-- Dependencies: 235
-- Name: assethealthmgmt_healthid_seq; Type: SEQUENCE SET; Schema: health; Owner: postgres
--

SELECT pg_catalog.setval('health.assethealthmgmt_healthid_seq', 1, false);


--
-- TOC entry 4073 (class 0 OID 0)
-- Dependencies: 231
-- Name: jobcontrol_jobid_seq; Type: SEQUENCE SET; Schema: health; Owner: postgres
--

SELECT pg_catalog.setval('health.jobcontrol_jobid_seq', 1, false);


--
-- TOC entry 3925 (class 2606 OID 19790)
-- Name: assetalertmgmt assetalertmgmt_pkey; Type: CONSTRAINT; Schema: health; Owner: postgres
--

ALTER TABLE ONLY health.assetalertmgmt
    ADD CONSTRAINT assetalertmgmt_pkey PRIMARY KEY (alertid);


--
-- TOC entry 3929 (class 2606 OID 19808)
-- Name: assethealthbin assethealthbin_pkey; Type: CONSTRAINT; Schema: health; Owner: postgres
--

ALTER TABLE ONLY health.assethealthbin
    ADD CONSTRAINT assethealthbin_pkey PRIMARY KEY (healthbinid);


--
-- TOC entry 3927 (class 2606 OID 19799)
-- Name: assethealthmgmt assethealthmgmt_pkey; Type: CONSTRAINT; Schema: health; Owner: postgres
--

ALTER TABLE ONLY health.assethealthmgmt
    ADD CONSTRAINT assethealthmgmt_pkey PRIMARY KEY (healthid);


--
-- TOC entry 3923 (class 2606 OID 19781)
-- Name: jobcontrol jobcontrol_pkey; Type: CONSTRAINT; Schema: health; Owner: postgres
--

ALTER TABLE ONLY health.jobcontrol
    ADD CONSTRAINT jobcontrol_pkey PRIMARY KEY (jobid);


-- Completed on 2020-02-07 08:55:47

--
-- PostgreSQL database dump complete
--

