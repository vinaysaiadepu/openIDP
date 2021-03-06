--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.3

-- Started on 2018-07-27 10:47:55

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;


CREATE DATABASE "IDP" WITH TEMPLATE = template0;


ALTER DATABASE "IDP" OWNER TO postgres;

--connect "IDP"


--
-- TOC entry 6 (class 2615 OID 16680)
-- Name: idpoauth; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA idpoauth;


ALTER SCHEMA idpoauth OWNER TO postgres;

--
-- TOC entry 1 (class 3079 OID 12393)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2460 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = idpoauth, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 186 (class 1259 OID 16681)
-- Name: tuser_info; Type: TABLE; Schema: idpoauth; Owner: postgres
--

CREATE TABLE tuser_info (
    user_id character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    email_id character varying(100),
    base_role_id bigint,
    enabled boolean,
    org_name text
);


ALTER TABLE tuser_info OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- TOC entry 187 (class 1259 OID 16688)
-- Name: dashboard_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE dashboard_info (
    id integer NOT NULL,
    application_name text NOT NULL,
    pipeline_name text NOT NULL,
    stage text NOT NULL,
    status text NOT NULL,
    pipeline_id text NOT NULL
);


ALTER TABLE dashboard_info OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16694)
-- Name: dashboard_info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dashboard_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dashboard_info_id_seq OWNER TO postgres;

--
-- TOC entry 2461 (class 0 OID 0)
-- Dependencies: 188
-- Name: dashboard_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE dashboard_info_id_seq OWNED BY dashboard_info.id;


--
-- TOC entry 227 (class 1259 OID 444615)
-- Name: filenet_export; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE filenet_export (
    object_id character varying,
    object_name character varying,
    object_type character varying,
    triggerid integer NOT NULL,
    env character varying,
    object_store character varying,
    object_json character varying
);


ALTER TABLE filenet_export OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 444621)
-- Name: filenet_import; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE filenet_import (
    triggerid integer NOT NULL,
    env_source character varying,
    env_destination character varying
);


ALTER TABLE filenet_import OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 131615)
-- Name: tadditional_job_param_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tadditional_job_param_details (
    application_id bigint,
    pipeline_id bigint,
    param_name character varying(500),
    param_value character varying(500),
    param_id integer NOT NULL,
    param_type character varying(10),
    static boolean
);


ALTER TABLE tadditional_job_param_details OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 131613)
-- Name: tadditional_job_param_details_param_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tadditional_job_param_details_param_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tadditional_job_param_details_param_id_seq OWNER TO postgres;

--
-- TOC entry 2462 (class 0 OID 0)
-- Dependencies: 214
-- Name: tadditional_job_param_details_param_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tadditional_job_param_details_param_id_seq OWNED BY tadditional_job_param_details.param_id;


--
-- TOC entry 189 (class 1259 OID 16696)
-- Name: tapplication_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tapplication_info (
    application_id integer NOT NULL,
    application_name character varying(100),
    entity_info json,
    platform integer
);


ALTER TABLE tapplication_info OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 16702)
-- Name: tapplication_info_application_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tapplication_info_application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tapplication_info_application_id_seq OWNER TO postgres;

--
-- TOC entry 2463 (class 0 OID 0)
-- Dependencies: 190
-- Name: tapplication_info_application_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tapplication_info_application_id_seq OWNED BY tapplication_info.application_id;


--
-- TOC entry 191 (class 1259 OID 16704)
-- Name: tapplication_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tapplication_roles (
    application_id bigint NOT NULL,
    role_id bigint NOT NULL,
    user_id character varying(50) NOT NULL
);


ALTER TABLE tapplication_roles OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 131479)
-- Name: tartifact_approval_artifact_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tartifact_approval_artifact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tartifact_approval_artifact_id_seq OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 131526)
-- Name: tartifact_approval; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tartifact_approval (
    artifact_id bigint DEFAULT nextval('tartifact_approval_artifact_id_seq'::regclass) NOT NULL,
    artifact_name character varying(200),
    release_id integer,
    env_id integer,
    status character varying(100),
    package_content json
);


ALTER TABLE tartifact_approval OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 344280)
-- Name: tartifact_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tartifact_history (
    seq_id bigint NOT NULL,
    artifact_id bigint,
    status character varying(100),
    remark character varying(500),
    environment character varying(100),
    env_owner character varying,
    action_time timestamp without time zone
);


ALTER TABLE tartifact_history OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 344286)
-- Name: tartifact_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tartifact_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tartifact_history_id_seq OWNER TO postgres;

--
-- TOC entry 2464 (class 0 OID 0)
-- Dependencies: 222
-- Name: tartifact_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tartifact_history_id_seq OWNED BY tartifact_history.seq_id;


--
-- TOC entry 217 (class 1259 OID 139556)
-- Name: tdbdeploy_operation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tdbdeploy_operation (
    sub_application_details_id integer NOT NULL,
    application_id bigint,
    sub_application character varying(50),
    operations character varying(500)
);


ALTER TABLE tdbdeploy_operation OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 139554)
-- Name: tdbdeploy_operation_sub_application_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tdbdeploy_operation_sub_application_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tdbdeploy_operation_sub_application_details_id_seq OWNER TO postgres;

--
-- TOC entry 2465 (class 0 OID 0)
-- Dependencies: 216
-- Name: tdbdeploy_operation_sub_application_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tdbdeploy_operation_sub_application_details_id_seq OWNED BY tdbdeploy_operation.sub_application_details_id;


--
-- TOC entry 206 (class 1259 OID 131473)
-- Name: tenvironment_master_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tenvironment_master_id_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tenvironment_master_id_seq OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 131481)
-- Name: tenvironment_master; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tenvironment_master (
    env_id integer DEFAULT nextval('tenvironment_master_id_seq'::regclass) NOT NULL,
    environment_name character varying(1000),
    application_id integer
);


ALTER TABLE tenvironment_master OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 131475)
-- Name: tenvironment_owner_env_owner_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tenvironment_owner_env_owner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tenvironment_owner_env_owner_id_seq OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 131494)
-- Name: tenvironment_owner; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tenvironment_owner (
    env_owner_id integer DEFAULT nextval('tenvironment_owner_env_owner_id_seq'::regclass) NOT NULL,
    env_id integer,
    owner_name character varying(100),
    owner_type character varying(100)
);


ALTER TABLE tenvironment_owner OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 469021)
-- Name: tenvironment_planning; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tenvironment_planning (
    release_no character varying(100) NOT NULL,
    application_name text NOT NULL,
    environment character varying(100) NOT NULL,
    start_time text,
    end_time text,
    type_plan character varying(100) NOT NULL,
    on_plan character varying(500)
);


ALTER TABLE tenvironment_planning OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 16707)
-- Name: tjob_create_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tjob_create_status (
    session_id bigint NOT NULL,
    pipeline_id bigint,
    job_name character varying(50),
    last_modified date,
    create_status character varying(50)
);


ALTER TABLE tjob_create_status OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 16710)
-- Name: tjob_run_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tjob_run_status (
    session_id bigint NOT NULL,
    pipeline_id bigint,
    build_id character varying(50),
    job_name character varying(100),
    last_modified date,
    job_run_status character varying(50)
);


ALTER TABLE tjob_run_status OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 444588)
-- Name: torg_info_org_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE torg_info_org_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE torg_info_org_id_seq OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 444590)
-- Name: torg_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE torg_info (
    org_id integer DEFAULT nextval('torg_info_org_id_seq'::regclass) NOT NULL,
    org_name character varying,
    org_domain character varying
);


ALTER TABLE torg_info OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 16713)
-- Name: tpersistent_logins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tpersistent_logins (
    username character varying(64) NOT NULL,
    series character varying(64) NOT NULL,
    token character varying(64) NOT NULL,
    last_used timestamp without time zone NOT NULL
);


ALTER TABLE tpersistent_logins OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 16716)
-- Name: tpipeline_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tpipeline_history (
    pipeline_id bigint,
    session_id character varying(50) NOT NULL,
    user_id character varying(50),
    last_modified date
);


ALTER TABLE tpipeline_history OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16719)
-- Name: tpipeline_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tpipeline_info (
    pipeline_name character varying(100),
    pipeline_id integer NOT NULL,
    application_id bigint,
    creation_date timestamp without time zone DEFAULT now(),
    active boolean DEFAULT true,
    entity_info bytea,
    technology character varying(100),
    build_tool character varying(100)
);


ALTER TABLE tpipeline_info OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16727)
-- Name: tpipeline_info_pipeline_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tpipeline_info_pipeline_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tpipeline_info_pipeline_id_seq OWNER TO postgres;

--
-- TOC entry 2466 (class 0 OID 0)
-- Dependencies: 197
-- Name: tpipeline_info_pipeline_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tpipeline_info_pipeline_id_seq OWNED BY tpipeline_info.pipeline_id;


--
-- TOC entry 220 (class 1259 OID 287020)
-- Name: tpipeline_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tpipeline_roles (
    pipeline_id bigint NOT NULL,
    role_id integer NOT NULL,
    user_id character varying(500),
    app_id bigint
);


ALTER TABLE tpipeline_roles OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 57559)
-- Name: trelease_info_release_if_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE trelease_info_release_if_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trelease_info_release_if_seq OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 57561)
-- Name: trelease_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE trelease_info (
    release_number character varying,
    vsts_release_number character varying,
    expected_start_date timestamp without time zone,
    expected_end_date timestamp without time zone,
    actaul_start_date timestamp without time zone,
    actual_end_date timestamp without time zone,
    remarks character varying,
    branch_list character varying,
    pipeline_id bigint,
    application_id bigint,
    release_id integer DEFAULT nextval('trelease_info_release_if_seq'::regclass) NOT NULL,
    status character varying,
    email character varying
);


ALTER TABLE trelease_info OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 131477)
-- Name: trelease_path_config_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE trelease_path_config_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trelease_path_config_id_seq OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 131505)
-- Name: trelease_path_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE trelease_path_config (
    id bigint DEFAULT nextval('trelease_path_config_id_seq'::regclass) NOT NULL,
    env_id integer,
    parent_env_id integer,
    path_id character varying(100),
    release_id integer
);


ALTER TABLE trelease_path_config OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16729)
-- Name: trole_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE trole_permissions (
    role_id bigint NOT NULL,
    permission_key character varying(50) NOT NULL
);


ALTER TABLE trole_permissions OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16732)
-- Name: troles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE troles (
    role_id integer NOT NULL,
    role_name character varying(50)
);


ALTER TABLE troles OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16735)
-- Name: troles_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE troles_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE troles_role_id_seq OWNER TO postgres;

--
-- TOC entry 2467 (class 0 OID 0)
-- Dependencies: 200
-- Name: troles_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE troles_role_id_seq OWNED BY troles.role_id;


--
-- TOC entry 233 (class 1259 OID 518235)
-- Name: tsap_cr_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tsap_cr_info (
    trigger_id integer NOT NULL,
    title character varying(50),
    "desc" character varying(100),
    status character varying(50),
    impact character varying(50),
    priority character varying(50),
    "unitTesting" character varying(100),
    cr_id character varying(100)
);


ALTER TABLE tsap_cr_info OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 468994)
-- Name: tsap_deploy_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tsap_deploy_details (
    trigger_id integer NOT NULL,
    transport_request character varying(50),
    object_name character varying(50) NOT NULL,
    deploy_operation character varying(10) NOT NULL,
    landscape character varying(50),
    object_type character varying(50) NOT NULL,
    username character varying(50),
    task_associated character varying(50),
    object_timestamp timestamp without time zone
);


ALTER TABLE tsap_deploy_details OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 469009)
-- Name: tsap_rebase_transport_requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tsap_rebase_transport_requests (
    dummytr character varying,
    sprinttr character varying,
    bugtr character varying,
    tr_id integer NOT NULL,
    object_name character varying(50),
    object_type character varying(50)
);


ALTER TABLE tsap_rebase_transport_requests OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 469007)
-- Name: tsap_rebase_transport_requests_tr_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tsap_rebase_transport_requests_tr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tsap_rebase_transport_requests_tr_id_seq OWNER TO postgres;

--
-- TOC entry 2468 (class 0 OID 0)
-- Dependencies: 230
-- Name: tsap_rebase_transport_requests_tr_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tsap_rebase_transport_requests_tr_id_seq OWNED BY tsap_rebase_transport_requests.tr_id;


--
-- TOC entry 219 (class 1259 OID 139584)
-- Name: tslave_detials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tslave_detials (
    slave_id integer NOT NULL,
    application_id bigint,
    slave_name character varying(100),
    "slaveOS" character varying(50),
    usage character varying(50),
    build character varying(5),
    deploy character varying(5),
    test character varying(5),
    labels character varying(200)
);


ALTER TABLE tslave_detials OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 139582)
-- Name: tslave_detials_slave_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tslave_detials_slave_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tslave_detials_slave_id_seq OWNER TO postgres;

--
-- TOC entry 2469 (class 0 OID 0)
-- Dependencies: 218
-- Name: tslave_detials_slave_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tslave_detials_slave_id_seq OWNED BY tslave_detials.slave_id;


--
-- TOC entry 226 (class 1259 OID 444607)
-- Name: tsubscription_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tsubscription_info (
    subscription_type character varying NOT NULL,
    expiry_date date,
    org_name text NOT NULL
);


ALTER TABLE tsubscription_info OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 444599)
-- Name: tsubscription_master; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tsubscription_master (
    subscription_type character varying NOT NULL,
    permission character varying NOT NULL
);


ALTER TABLE tsubscription_master OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16742)
-- Name: ttrigger_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ttrigger_history (
    trigger_id integer NOT NULL,
    pipeline_id bigint,
    trigger_entity json,
    release_number character varying(20),
    trigger_time timestamp with time zone DEFAULT now(),
    version character varying,
    jiraprojectkey character varying(20),
    userstorystring character varying(50),
    tfs_workitem character varying(20),
    build_status character varying(10),
    execution_no_link character varying(500),
    scm_branch character varying(80),
    environment character varying(50),
    deploy_status character varying(10),
    test_status character varying(10),
    artifact_link character varying(500),
    build_triggered character varying(10),
    deploy_triggered character varying(10),
    test_triggered character varying(10),
    artifact_name character varying(200)
);


ALTER TABLE ttrigger_history OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16749)
-- Name: ttrigger_history_trigger_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ttrigger_history_trigger_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ttrigger_history_trigger_id_seq OWNER TO postgres;

--
-- TOC entry 2470 (class 0 OID 0)
-- Dependencies: 202
-- Name: ttrigger_history_trigger_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ttrigger_history_trigger_id_seq OWNED BY ttrigger_history.trigger_id;


--
-- TOC entry 203 (class 1259 OID 16751)
-- Name: tuser_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tuser_info (
    user_id character varying(50) NOT NULL,
    email_id character varying(100),
    base_role_id bigint,
    enabled boolean,
    org_id bigint DEFAULT 1
);


ALTER TABLE tuser_info OWNER TO postgres;


CREATE TABLE tnotification_info
(
    "id" SERIAL,
    "status" character varying,
    username character varying,
    pipeline_name character varying ,
    creation_date timestamp DEFAULT now(),
    CONSTRAINT tnotification_info_pkey PRIMARY KEY ("id")
);

ALTER TABLE tnotification_info OWNER TO postgres;

--
-- TOC entry 2181 (class 2604 OID 16754)
-- Name: dashboard_info id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dashboard_info ALTER COLUMN id SET DEFAULT nextval('dashboard_info_id_seq'::regclass);


--
-- TOC entry 2195 (class 2604 OID 131618)
-- Name: tadditional_job_param_details param_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tadditional_job_param_details ALTER COLUMN param_id SET DEFAULT nextval('tadditional_job_param_details_param_id_seq'::regclass);


--
-- TOC entry 2182 (class 2604 OID 16755)
-- Name: tapplication_info application_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tapplication_info ALTER COLUMN application_id SET DEFAULT nextval('tapplication_info_application_id_seq'::regclass);


--
-- TOC entry 2198 (class 2604 OID 344288)
-- Name: tartifact_history seq_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tartifact_history ALTER COLUMN seq_id SET DEFAULT nextval('tartifact_history_id_seq'::regclass);


--
-- TOC entry 2196 (class 2604 OID 139559)
-- Name: tdbdeploy_operation sub_application_details_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdbdeploy_operation ALTER COLUMN sub_application_details_id SET DEFAULT nextval('tdbdeploy_operation_sub_application_details_id_seq'::regclass);


--
-- TOC entry 2185 (class 2604 OID 16756)
-- Name: tpipeline_info pipeline_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tpipeline_info ALTER COLUMN pipeline_id SET DEFAULT nextval('tpipeline_info_pipeline_id_seq'::regclass);


--
-- TOC entry 2186 (class 2604 OID 16757)
-- Name: troles role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY troles ALTER COLUMN role_id SET DEFAULT nextval('troles_role_id_seq'::regclass);


--
-- TOC entry 2200 (class 2604 OID 469012)
-- Name: tsap_rebase_transport_requests tr_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tsap_rebase_transport_requests ALTER COLUMN tr_id SET DEFAULT nextval('tsap_rebase_transport_requests_tr_id_seq'::regclass);


--
-- TOC entry 2197 (class 2604 OID 139587)
-- Name: tslave_detials slave_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tslave_detials ALTER COLUMN slave_id SET DEFAULT nextval('tslave_detials_slave_id_seq'::regclass);


--
-- TOC entry 2188 (class 2604 OID 16759)
-- Name: ttrigger_history trigger_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ttrigger_history ALTER COLUMN trigger_id SET DEFAULT nextval('ttrigger_history_trigger_id_seq'::regclass);



SET search_path = idpoauth, pg_catalog;

--
-- TOC entry 2202 (class 2606 OID 444579)
-- Name: tuser_info user_id_pkey; Type: CONSTRAINT; Schema: idpoauth; Owner: postgres
--

ALTER TABLE ONLY tuser_info
    ADD CONSTRAINT user_id_pkey PRIMARY KEY (user_id);


SET search_path = public, pg_catalog;

--
-- TOC entry 2248 (class 2606 OID 131623)
-- Name: tadditional_job_param_details additional_job_param_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tadditional_job_param_details
    ADD CONSTRAINT additional_job_param_details_pkey PRIMARY KEY (param_id);


--
-- TOC entry 2218 (class 2606 OID 17634)
-- Name: tpipeline_history application_history_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tpipeline_history
    ADD CONSTRAINT application_history_pk PRIMARY KEY (session_id);


--
-- TOC entry 2206 (class 2606 OID 17636)
-- Name: tapplication_info application_info_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tapplication_info
    ADD CONSTRAINT application_info_pk PRIMARY KEY (application_id);


--
-- TOC entry 2232 (class 2606 OID 57571)
-- Name: trelease_info application_pipeline_release; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trelease_info
    ADD CONSTRAINT application_pipeline_release UNIQUE (application_id, release_number, pipeline_id);


--
-- TOC entry 2210 (class 2606 OID 17638)
-- Name: tapplication_roles application_roles_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tapplication_roles
    ADD CONSTRAINT application_roles_pk PRIMARY KEY (application_id, role_id, user_id);


--
-- TOC entry 2208 (class 2606 OID 17640)
-- Name: tapplication_info application_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tapplication_info
    ADD CONSTRAINT application_unique UNIQUE (application_name);


--
-- TOC entry 2244 (class 2606 OID 131531)
-- Name: tartifact_approval artifact_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tartifact_approval
    ADD CONSTRAINT artifact_id PRIMARY KEY (artifact_id);


--
-- TOC entry 2246 (class 2606 OID 131533)
-- Name: tartifact_approval artifact_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tartifact_approval
    ADD CONSTRAINT artifact_unique UNIQUE (release_id, artifact_name, env_id);


--
-- TOC entry 2204 (class 2606 OID 17642)
-- Name: dashboard_info dashboard_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dashboard_info
    ADD CONSTRAINT dashboard_info_pkey PRIMARY KEY (id);


--
-- TOC entry 2252 (class 2606 OID 139564)
-- Name: tdbdeploy_operation dbdeploy_operation_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdbdeploy_operation
    ADD CONSTRAINT dbdeploy_operation_pk PRIMARY KEY (sub_application_details_id);


--
-- TOC entry 2236 (class 2606 OID 131588)
-- Name: tenvironment_master env_app_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tenvironment_master
    ADD CONSTRAINT env_app_id UNIQUE (application_id, environment_name);


--
-- TOC entry 2238 (class 2606 OID 131486)
-- Name: tenvironment_master env_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tenvironment_master
    ADD CONSTRAINT env_id PRIMARY KEY (env_id);


--
-- TOC entry 2240 (class 2606 OID 131499)
-- Name: tenvironment_owner env_owner_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tenvironment_owner
    ADD CONSTRAINT env_owner_id PRIMARY KEY (env_owner_id);


--
-- TOC entry 2242 (class 2606 OID 131510)
-- Name: trelease_path_config id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trelease_path_config
    ADD CONSTRAINT id PRIMARY KEY (id);


--
-- TOC entry 2212 (class 2606 OID 17644)
-- Name: tjob_create_status job_create_status_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tjob_create_status
    ADD CONSTRAINT job_create_status_pk PRIMARY KEY (session_id);


--
-- TOC entry 2214 (class 2606 OID 17646)
-- Name: tjob_run_status job_run_status_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tjob_run_status
    ADD CONSTRAINT job_run_status_pk PRIMARY KEY (session_id);


--
-- TOC entry 2216 (class 2606 OID 17648)
-- Name: tpersistent_logins persistent_logins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tpersistent_logins
    ADD CONSTRAINT persistent_logins_pkey PRIMARY KEY (series);


--
-- TOC entry 2220 (class 2606 OID 17650)
-- Name: tpipeline_info pipeline_info_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tpipeline_info
    ADD CONSTRAINT pipeline_info_pk PRIMARY KEY (pipeline_id);


--
-- TOC entry 2222 (class 2606 OID 17652)
-- Name: tpipeline_info pipeline_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tpipeline_info
    ADD CONSTRAINT pipeline_unique UNIQUE (pipeline_name, application_id);


--
-- TOC entry 2266 (class 2606 OID 469017)
-- Name: tsap_rebase_transport_requests pk_tr_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tsap_rebase_transport_requests
    ADD CONSTRAINT pk_tr_id PRIMARY KEY (tr_id);


--
-- TOC entry 2234 (class 2606 OID 57569)
-- Name: trelease_info release_info_FK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trelease_info
    ADD CONSTRAINT "release_info_FK" PRIMARY KEY (release_id);


--
-- TOC entry 2224 (class 2606 OID 17654)
-- Name: trole_permissions role_permissions_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trole_permissions
    ADD CONSTRAINT role_permissions_pk PRIMARY KEY (role_id, permission_key);


--
-- TOC entry 2226 (class 2606 OID 17657)
-- Name: troles roles_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY troles
    ADD CONSTRAINT roles_pk PRIMARY KEY (role_id);


--
-- TOC entry 2254 (class 2606 OID 139589)
-- Name: tslave_detials slave_detials_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tslave_detials
    ADD CONSTRAINT slave_detials_pk PRIMARY KEY (slave_id);


--
-- TOC entry 2256 (class 2606 OID 139591)
-- Name: tslave_detials slave_detials_unique_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tslave_detials
    ADD CONSTRAINT slave_detials_unique_constraint UNIQUE (application_id, slave_name);


--
-- TOC entry 2250 (class 2606 OID 131625)
-- Name: tadditional_job_param_details tadditional_job_param_details_pipeline_id_param_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tadditional_job_param_details
    ADD CONSTRAINT tadditional_job_param_details_pipeline_id_param_name_key UNIQUE (pipeline_id, param_name);


--
-- TOC entry 2258 (class 2606 OID 444598)
-- Name: torg_info torg_info_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY torg_info
    ADD CONSTRAINT "torg_info_PK" PRIMARY KEY (org_id);


--
-- TOC entry 2228 (class 2606 OID 17661)
-- Name: ttrigger_history trigger_history_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ttrigger_history
    ADD CONSTRAINT trigger_history_pk PRIMARY KEY (trigger_id);


--
-- TOC entry 2264 (class 2606 OID 468998)
-- Name: tsap_deploy_details tsap_deploy_details_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tsap_deploy_details
    ADD CONSTRAINT tsap_deploy_details_pk PRIMARY KEY (trigger_id, object_name, object_type, deploy_operation);


--
-- TOC entry 2262 (class 2606 OID 501762)
-- Name: tsubscription_info tsubscription_info_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tsubscription_info
    ADD CONSTRAINT "tsubscription_info_PK" PRIMARY KEY (subscription_type, org_name);


--
-- TOC entry 2260 (class 2606 OID 444606)
-- Name: tsubscription_master tsubscription_master_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tsubscription_master
    ADD CONSTRAINT "tsubscription_master_PK" PRIMARY KEY (subscription_type, permission);


--
-- TOC entry 2230 (class 2606 OID 17664)
-- Name: tuser_info user_info_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tuser_info
    ADD CONSTRAINT user_info_pk PRIMARY KEY (user_id);


--
-- TOC entry 2270 (class 2606 OID 17665)
-- Name: tpipeline_history application_history_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tpipeline_history
    ADD CONSTRAINT application_history_user_id_fk FOREIGN KEY (user_id) REFERENCES tuser_info(user_id);


--
-- TOC entry 2275 (class 2606 OID 131489)
-- Name: tenvironment_master application_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tenvironment_master
    ADD CONSTRAINT application_id FOREIGN KEY (application_id) REFERENCES tapplication_info(application_id);


--
-- TOC entry 2267 (class 2606 OID 17670)
-- Name: tapplication_roles application_roles_application_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tapplication_roles
    ADD CONSTRAINT application_roles_application_id_fk FOREIGN KEY (application_id) REFERENCES tapplication_info(application_id);


--
-- TOC entry 2268 (class 2606 OID 17675)
-- Name: tapplication_roles application_roles_role_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tapplication_roles
    ADD CONSTRAINT application_roles_role_id_fk FOREIGN KEY (role_id) REFERENCES troles(role_id);


--
-- TOC entry 2269 (class 2606 OID 17680)
-- Name: tapplication_roles application_roles_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tapplication_roles
    ADD CONSTRAINT application_roles_user_id FOREIGN KEY (user_id) REFERENCES tuser_info(user_id);


--
-- TOC entry 2276 (class 2606 OID 131500)
-- Name: tenvironment_owner env_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tenvironment_owner
    ADD CONSTRAINT env_id FOREIGN KEY (env_id) REFERENCES tenvironment_master(env_id);


--
-- TOC entry 2277 (class 2606 OID 131511)
-- Name: trelease_path_config env_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trelease_path_config
    ADD CONSTRAINT env_id FOREIGN KEY (env_id) REFERENCES tenvironment_master(env_id);


--
-- TOC entry 2280 (class 2606 OID 131534)
-- Name: tartifact_approval env_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tartifact_approval
    ADD CONSTRAINT env_id FOREIGN KEY (env_id) REFERENCES tenvironment_master(env_id);


--
-- TOC entry 2278 (class 2606 OID 131516)
-- Name: trelease_path_config parent_env_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trelease_path_config
    ADD CONSTRAINT parent_env_id FOREIGN KEY (parent_env_id) REFERENCES tenvironment_master(env_id);


--
-- TOC entry 2279 (class 2606 OID 131521)
-- Name: trelease_path_config release_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trelease_path_config
    ADD CONSTRAINT release_id FOREIGN KEY (release_id) REFERENCES trelease_info(release_id);


--
-- TOC entry 2281 (class 2606 OID 131539)
-- Name: tartifact_approval release_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tartifact_approval
    ADD CONSTRAINT release_id FOREIGN KEY (release_id) REFERENCES trelease_info(release_id);


--
-- TOC entry 2273 (class 2606 OID 57572)
-- Name: trelease_info release_info_appliaction_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trelease_info
    ADD CONSTRAINT "release_info_appliaction_FK" FOREIGN KEY (application_id) REFERENCES tapplication_info(application_id);


--
-- TOC entry 2274 (class 2606 OID 57577)
-- Name: trelease_info release_info_pipeline_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trelease_info
    ADD CONSTRAINT "release_info_pipeline_FK" FOREIGN KEY (pipeline_id) REFERENCES tpipeline_info(pipeline_id);


--
-- TOC entry 2271 (class 2606 OID 17685)
-- Name: trole_permissions role_permissions_role_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trole_permissions
    ADD CONSTRAINT role_permissions_role_id_fk FOREIGN KEY (role_id) REFERENCES troles(role_id);


--
-- TOC entry 2283 (class 2606 OID 139592)
-- Name: tslave_detials slave_detials_app_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tslave_detials
    ADD CONSTRAINT slave_detials_app_fk FOREIGN KEY (application_id) REFERENCES tapplication_info(application_id);


--
-- TOC entry 2282 (class 2606 OID 139565)
-- Name: tdbdeploy_operation tdbdeploy_operation_tapplication_info_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tdbdeploy_operation
    ADD CONSTRAINT tdbdeploy_operation_tapplication_info_fk FOREIGN KEY (application_id) REFERENCES tapplication_info(application_id);


--
-- TOC entry 2284 (class 2606 OID 287026)
-- Name: tpipeline_roles tpipeline_roles_app_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tpipeline_roles
    ADD CONSTRAINT tpipeline_roles_app_id_fk FOREIGN KEY (app_id) REFERENCES tapplication_info(application_id);


--
-- TOC entry 2285 (class 2606 OID 287031)
-- Name: tpipeline_roles tpipeline_roles_pipeline_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tpipeline_roles
    ADD CONSTRAINT tpipeline_roles_pipeline_id_fk FOREIGN KEY (pipeline_id) REFERENCES tpipeline_info(pipeline_id);


--
-- TOC entry 2286 (class 2606 OID 287036)
-- Name: tpipeline_roles tpipeline_roles_role_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tpipeline_roles
    ADD CONSTRAINT tpipeline_roles_role_id_fk FOREIGN KEY (role_id) REFERENCES troles(role_id);


--
-- TOC entry 2287 (class 2606 OID 287041)
-- Name: tpipeline_roles tpipeline_roles_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tpipeline_roles
    ADD CONSTRAINT tpipeline_roles_user_id FOREIGN KEY (user_id) REFERENCES tuser_info(user_id);


--
-- TOC entry 2272 (class 2606 OID 17695)
-- Name: ttrigger_history trigger_history_pipeline_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ttrigger_history
    ADD CONSTRAINT trigger_history_pipeline_fk FOREIGN KEY (pipeline_id) REFERENCES tpipeline_info(pipeline_id);


--
-- TOC entry 2288 (class 2606 OID 468999)
-- Name: tsap_deploy_details tsap_deploy__trigger_details_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tsap_deploy_details
    ADD CONSTRAINT tsap_deploy__trigger_details_fk FOREIGN KEY (trigger_id) REFERENCES ttrigger_history(trigger_id);


	
	
INSERT INTO torg_info (org_name,org_domain) VALUES ('Infosys', 'infosys.com');

INSERT INTO tuser_info VALUES ('idpadmin', 'idp_oss@xyz.com', 5, true, 1);
	
	

INSERT INTO troles VALUES (1, 'PIPELINE_ADMIN');
INSERT INTO troles VALUES (2, 'DEVELOPER');
INSERT INTO troles VALUES (3, 'RELEASE_MANAGER');
INSERT INTO troles VALUES (4, 'ENVIRONMENT_OWNER');
INSERT INTO troles VALUES (5, 'IDP_ADMIN');
INSERT INTO troles VALUES (6, 'QA');
INSERT INTO troles VALUES (7, 'DB_OWNER');
INSERT INTO troles VALUES (8, 'BASIC_INFO_ADMIN');
INSERT INTO troles VALUES (9, 'CODE_INFO_ADMIN');
INSERT INTO troles VALUES (10, 'BUILD_INFO_ADMIN');
INSERT INTO troles VALUES (11, 'DEPLOY_INFO_ADMIN');
INSERT INTO troles VALUES (12, 'TEST_INFO_ADMIN');
INSERT INTO troles VALUES (13, 'IDP_MASTER_ADMIN');
INSERT INTO troles VALUES (14, 'TEST_ADMIN');
INSERT INTO troles VALUES (15, 'TESTER');
	
	
	
INSERT INTO trole_permissions VALUES (1, 'CREATE_PIPELINE');
INSERT INTO trole_permissions VALUES (1, 'COPY_PIPELINE');
INSERT INTO trole_permissions VALUES (1, 'EDIT_PIPELINE');
INSERT INTO trole_permissions VALUES (1, 'VIEW_PIPELINE');
INSERT INTO trole_permissions VALUES (1, 'DELETE_PIPELINE');
INSERT INTO trole_permissions VALUES (1, 'BUILD');

INSERT INTO trole_permissions VALUES (2, 'BUILD');
INSERT INTO trole_permissions VALUES (2, 'VIEW_PIPELINE');

INSERT INTO trole_permissions VALUES (3, 'BUILD');
INSERT INTO trole_permissions VALUES (3, 'RELEASE');
INSERT INTO trole_permissions VALUES (3, 'VIEW_PIPELINE');

INSERT INTO trole_permissions VALUES (4, 'BUILD');
INSERT INTO trole_permissions VALUES (4, 'DEPLOY');
INSERT INTO trole_permissions VALUES (4, 'TEST');
INSERT INTO trole_permissions VALUES (4, 'VIEW_PIPELINE');

INSERT INTO trole_permissions VALUES (5, 'CREATE_APPLICATION');
INSERT INTO trole_permissions VALUES (5, 'EDIT_APPLICATION');
INSERT INTO trole_permissions VALUES (5, 'CREATE_LICENSE');



INSERT INTO trole_permissions VALUES (6, 'VIEW_PIPELINE');
INSERT INTO trole_permissions VALUES (6, 'DATABASE_BUILD');
INSERT INTO trole_permissions VALUES (6, 'DATABASE_DEPLOY');
INSERT INTO trole_permissions VALUES (6, 'DATABASE_TEST');
INSERT INTO trole_permissions VALUES (6, 'BUILD');
INSERT INTO trole_permissions VALUES (6, 'DEPLOY');
INSERT INTO trole_permissions VALUES (6, 'TEST');

INSERT INTO trole_permissions VALUES (8, 'VIEW_BASIC_INFO');
INSERT INTO trole_permissions VALUES (8, 'EDIT_BASIC_INFO');

INSERT INTO trole_permissions VALUES (9, 'EDIT_CODE_INFO');
INSERT INTO trole_permissions VALUES (9, 'VIEW_CODE_INFO');

INSERT INTO trole_permissions VALUES (10, 'EDIT_BUILD_INFO');
INSERT INTO trole_permissions VALUES (10, 'VIEW_BUILD_INFO');

INSERT INTO trole_permissions VALUES (11, 'VIEW_TEST_INFO');
INSERT INTO trole_permissions VALUES (11, 'VIEW_DEPLOY_INFO');
INSERT INTO trole_permissions VALUES (11, 'EDIT_DEPLOY_INFO');

INSERT INTO trole_permissions VALUES (12, 'EDIT_TEST_INFO');

INSERT INTO trole_permissions VALUES (13, 'CREATE_ORGANIZATION');

INSERT INTO trole_permissions VALUES (14, 'CREATE_PIPELINE');
INSERT INTO trole_permissions VALUES (14, 'COPY_PIPELINE');
INSERT INTO trole_permissions VALUES (14, 'EDIT_PIPELINE');
INSERT INTO trole_permissions VALUES (14, 'VIEW_PIPELINE');
INSERT INTO trole_permissions VALUES (14, 'DELETE_PIPELINE');
INSERT INTO trole_permissions VALUES (14, 'BUILD');

INSERT INTO trole_permissions VALUES (15, 'VIEW_PIPELINE');
INSERT INTO trole_permissions VALUES (15, 'BUILD');
	
	
INSERT INTO idpoauth.tuser_info (user_id,org_name) VALUES ('idpadmin','INFOSYS');


INSERT INTO tsubscription_master(subscription_type, permission) VALUES('CI','CREATE_BUILD_SUBSCRIBED');
INSERT INTO tsubscription_master(subscription_type, permission) VALUES('CD','CREATE_DEPLOY_SUBSCRIBED');
INSERT INTO tsubscription_master(subscription_type, permission) VALUES('CT','CREATE_TEST_SUBSCRIBED');


INSERT INTO tsubscription_info(subscription_type, expiry_date, org_name) VALUES('CI','2020-07-22','INFOSYS');
INSERT INTO tsubscription_info(subscription_type, expiry_date, org_name) VALUES('CD','2020-07-22','INFOSYS');
INSERT INTO tsubscription_info(subscription_type, expiry_date, org_name) VALUES('CT','2020-07-22','INFOSYS');





-- Completed on 2018-07-27 10:47:59

--
-- PostgreSQL database dump complete
--

