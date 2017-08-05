--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

-- Started on 2017-07-20 18:12:31 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2206 (class 1262 OID 16384)
-- Name: contents; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE contents WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE contents OWNER TO postgres;

\connect contents

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12393)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2209 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 16385)
-- Name: content; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE content (
    id bigint NOT NULL,
    unit_id bigint,
    browsertitle character varying(255) DEFAULT NULL::character varying,
    clienttype character varying(255) DEFAULT NULL::character varying,
    contenttype character varying(255) DEFAULT NULL::character varying,
    description text,
    friendlyurl character varying(255) DEFAULT NULL::character varying,
    imagepath text,
    keywords text,
    active smallint,
    expirationdate date,
    publicationdate date,
    title character varying(255) DEFAULT NULL::character varying,
    region_id bigint,
    show_id bigint
);


ALTER TABLE content OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 24576)
-- Name: content_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE content_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE content_id_seq OWNER TO postgres;

--
-- TOC entry 2210 (class 0 OID 0)
-- Dependencies: 190
-- Name: content_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE content_id_seq OWNED BY content.id;


--
-- TOC entry 192 (class 1259 OID 24594)
-- Name: language_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE language_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE language_id_seq OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16409)
-- Name: language; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE language (
    id bigint DEFAULT nextval('language_id_seq'::regclass) NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE language OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 24598)
-- Name: localizedcontent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE localizedcontent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE localizedcontent_id_seq OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 24579)
-- Name: localizedcontenttype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE localizedcontenttype (
    id bigint DEFAULT nextval('localizedcontent_id_seq'::regclass) NOT NULL,
    contenttype character varying(255) DEFAULT NULL::character varying,
    name character varying(255) DEFAULT NULL::character varying,
    region_id bigint
);


ALTER TABLE localizedcontenttype OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 24596)
-- Name: region_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE region_id_seq OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16431)
-- Name: region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE region (
    id bigint DEFAULT nextval('region_id_seq'::regclass) NOT NULL,
    code character varying(255) DEFAULT NULL::character varying,
    name character varying(255) DEFAULT NULL::character varying,
    timezone character varying(255) DEFAULT NULL::character varying,
    language_id bigint
);


ALTER TABLE region OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16446)
-- Name: seometadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE seometadata (
    id bigint NOT NULL,
    unit_id bigint,
    name character varying(255) DEFAULT NULL::character varying,
    browsertitle character varying(255) DEFAULT NULL::character varying,
    description character varying(255) DEFAULT NULL::character varying,
    keywords character varying(255) DEFAULT NULL::character varying,
    title character varying(255) DEFAULT NULL::character varying,
    region_id bigint
);


ALTER TABLE seometadata OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 24600)
-- Name: show_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE show_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE show_id_seq OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16421)
-- Name: show; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE show (
    id bigint DEFAULT nextval('show_id_seq'::regclass) NOT NULL,
    unit_id bigint,
    description text,
    name character varying(255) DEFAULT NULL::character varying,
    region_id bigint
);


ALTER TABLE show OWNER TO postgres;

--
-- TOC entry 2044 (class 2604 OID 24578)
-- Name: content id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY content ALTER COLUMN id SET DEFAULT nextval('content_id_seq'::regclass);


--
-- TOC entry 2063 (class 2606 OID 16418)
-- Name: language code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY language
    ADD CONSTRAINT code UNIQUE (code);


--
-- TOC entry 2061 (class 2606 OID 16401)
-- Name: content content_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY content
    ADD CONSTRAINT content_pkey PRIMARY KEY (id);


--
-- TOC entry 2071 (class 2606 OID 16460)
-- Name: region feed_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY region
    ADD CONSTRAINT feed_code UNIQUE (code);


--
-- TOC entry 2073 (class 2606 OID 16462)
-- Name: region feed_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY region
    ADD CONSTRAINT feed_name UNIQUE (name);


--
-- TOC entry 2075 (class 2606 OID 16445)
-- Name: region feed_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY region
    ADD CONSTRAINT feed_pkey PRIMARY KEY (id);


--
-- TOC entry 2065 (class 2606 OID 16416)
-- Name: language language_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY language
    ADD CONSTRAINT language_pkey PRIMARY KEY (id);


--
-- TOC entry 2079 (class 2606 OID 24588)
-- Name: localizedcontenttype localizedcontenttype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY localizedcontenttype
    ADD CONSTRAINT localizedcontenttype_pkey PRIMARY KEY (id);


--
-- TOC entry 2067 (class 2606 OID 16420)
-- Name: language name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY language
    ADD CONSTRAINT name UNIQUE (name);


--
-- TOC entry 2077 (class 2606 OID 16458)
-- Name: seometadata seometadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY seometadata
    ADD CONSTRAINT seometadata_pkey PRIMARY KEY (id);


--
-- TOC entry 2069 (class 2606 OID 16430)
-- Name: show show_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY show
    ADD CONSTRAINT show_pkey PRIMARY KEY (id);


--
-- TOC entry 2081 (class 2606 OID 16468)
-- Name: content content_region_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY content
    ADD CONSTRAINT content_region_fkey FOREIGN KEY (region_id) REFERENCES region(id);


--
-- TOC entry 2080 (class 2606 OID 16473)
-- Name: content content_show_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY content
    ADD CONSTRAINT content_show_fkey FOREIGN KEY (show_id) REFERENCES show(id);


--
-- TOC entry 2084 (class 2606 OID 24589)
-- Name: localizedcontenttype feed_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY localizedcontenttype
    ADD CONSTRAINT feed_fkey FOREIGN KEY (region_id) REFERENCES region(id);


--
-- TOC entry 2082 (class 2606 OID 16463)
-- Name: region feel_lang_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY region
    ADD CONSTRAINT feel_lang_fkey FOREIGN KEY (language_id) REFERENCES language(id);


--
-- TOC entry 2083 (class 2606 OID 16478)
-- Name: seometadata seo_feed_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY seometadata
    ADD CONSTRAINT seo_feed_fkey FOREIGN KEY (region_id) REFERENCES region(id);


--
-- TOC entry 2208 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-07-20 18:12:31 -03

--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

-- Started on 2017-07-20 18:16:43 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- TOC entry 2203 (class 0 OID 16409)
-- Dependencies: 186
-- Data for Name: language; Type: TABLE DATA; Schema: public; Owner: postgres
--
