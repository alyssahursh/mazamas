--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: climb_month; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE climb_month AS ENUM (
    'january',
    'february',
    'march',
    'april',
    'may',
    'june',
    'july',
    'august',
    'september,october',
    'november',
    'december'
);


--
-- Name: climb_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE climb_status AS ENUM (
    'unpublished',
    'open',
    'full',
    'waitlist',
    'cancelled',
    'completed'
);


--
-- Name: climb_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE climb_type AS ENUM (
    'mazamas',
    'private',
    'other'
);


--
-- Name: membership_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE membership_status AS ENUM (
    'nonmember',
    'active',
    'lapsed'
);


--
-- Name: registration_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE registration_status AS ENUM (
    'applied',
    'accepted',
    'rejected',
    'waitlist',
    'leader',
    'assistant'
);


--
-- Name: snow_angle; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE snow_angle AS ENUM (
    'notapplicable',
    '35to50',
    'over50',
    'upto35'
);


--
-- Name: typical_gear; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE typical_gear AS ENUM (
    'snow',
    'scramble',
    'rock',
    'rockandsnow'
);


--
-- Name: typical_season; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE typical_season AS ENUM (
    'springsummer',
    'summerautumn'
);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: climb_classes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE climb_classes (
    id integer NOT NULL,
    code character varying,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    route_id integer
);


--
-- Name: climb_classes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE climb_classes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: climb_classes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE climb_classes_id_seq OWNED BY climb_classes.id;


--
-- Name: climb_grad_emphases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE climb_grad_emphases (
    id integer NOT NULL,
    code character varying,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: climb_grad_emphases_climbs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE climb_grad_emphases_climbs (
    climb_grad_emphasis_id integer NOT NULL,
    climb_id integer NOT NULL
);


--
-- Name: climb_grad_emphases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE climb_grad_emphases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: climb_grad_emphases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE climb_grad_emphases_id_seq OWNED BY climb_grad_emphases.id;


--
-- Name: climb_leader_profiles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE climb_leader_profiles (
    id integer NOT NULL,
    climbing_since integer,
    leader_since integer,
    pace integer,
    climb_preferences text,
    volunteer_history text,
    climb_achievements text,
    climb_philosophy text,
    summit_treat text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    photo_link character varying,
    bio character varying,
    user_id integer
);


--
-- Name: climb_leader_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE climb_leader_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: climb_leader_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE climb_leader_profiles_id_seq OWNED BY climb_leader_profiles.id;


--
-- Name: climb_schedules; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE climb_schedules (
    id integer NOT NULL,
    season character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    year integer
);


--
-- Name: climb_schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE climb_schedules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: climb_schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE climb_schedules_id_seq OWNED BY climb_schedules.id;


--
-- Name: climb_tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE climb_tags (
    id integer NOT NULL,
    code character varying,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: climb_tags_climbs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE climb_tags_climbs (
    climb_tag_id integer NOT NULL,
    climb_id integer NOT NULL
);


--
-- Name: climb_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE climb_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: climb_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE climb_tags_id_seq OWNED BY climb_tags.id;


--
-- Name: climber_educations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE climber_educations (
    id integer NOT NULL,
    year integer,
    leader character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    education_program_id integer
);


--
-- Name: climber_educations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE climber_educations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: climber_educations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE climber_educations_id_seq OWNED BY climber_educations.id;


--
-- Name: climber_profiles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE climber_profiles (
    id integer NOT NULL,
    bio text,
    volunteer_history text,
    physical_conditioning text,
    medical_condition text,
    medication text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer
);


--
-- Name: climber_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE climber_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: climber_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE climber_profiles_id_seq OWNED BY climber_profiles.id;


--
-- Name: education_programs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE education_programs (
    id integer NOT NULL,
    abbreviation character varying,
    name character varying,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: education_programs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE education_programs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: education_programs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE education_programs_id_seq OWNED BY education_programs.id;


--
-- Name: mountains; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mountains (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    latitude character varying,
    longitude character varying,
    state character varying,
    country character varying,
    continent character varying,
    summit_post_url character varying,
    google_maps_url character varying,
    elevation_feet character varying,
    elevation_meters character varying,
    summit_post_name character varying
);


--
-- Name: mountains_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE mountains_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mountains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE mountains_id_seq OWNED BY mountains.id;


--
-- Name: specific_dates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE specific_dates (
    id integer NOT NULL,
    date_leave_town date,
    date_leave_trailhead date,
    date_summit date,
    date_return_trailhead date,
    date_return_town date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: specific_dates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE specific_dates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: specific_dates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE specific_dates_id_seq OWNED BY specific_dates.id;


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE user_roles (
    id integer NOT NULL,
    role character varying,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: user_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_roles_id_seq OWNED BY user_roles.id;


--
-- Name: user_roles_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE user_roles_users (
    user_role_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: climb_classes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY climb_classes ALTER COLUMN id SET DEFAULT nextval('climb_classes_id_seq'::regclass);


--
-- Name: climb_grad_emphases id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY climb_grad_emphases ALTER COLUMN id SET DEFAULT nextval('climb_grad_emphases_id_seq'::regclass);


--
-- Name: climb_leader_profiles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY climb_leader_profiles ALTER COLUMN id SET DEFAULT nextval('climb_leader_profiles_id_seq'::regclass);


--
-- Name: climb_schedules id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY climb_schedules ALTER COLUMN id SET DEFAULT nextval('climb_schedules_id_seq'::regclass);


--
-- Name: climb_tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY climb_tags ALTER COLUMN id SET DEFAULT nextval('climb_tags_id_seq'::regclass);


--
-- Name: climber_educations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY climber_educations ALTER COLUMN id SET DEFAULT nextval('climber_educations_id_seq'::regclass);


--
-- Name: climber_profiles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY climber_profiles ALTER COLUMN id SET DEFAULT nextval('climber_profiles_id_seq'::regclass);


--
-- Name: education_programs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY education_programs ALTER COLUMN id SET DEFAULT nextval('education_programs_id_seq'::regclass);


--
-- Name: mountains id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY mountains ALTER COLUMN id SET DEFAULT nextval('mountains_id_seq'::regclass);


--
-- Name: specific_dates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY specific_dates ALTER COLUMN id SET DEFAULT nextval('specific_dates_id_seq'::regclass);


--
-- Name: user_roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_roles ALTER COLUMN id SET DEFAULT nextval('user_roles_id_seq'::regclass);


--
-- Name: climb_classes climb_classes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY climb_classes
    ADD CONSTRAINT climb_classes_pkey PRIMARY KEY (id);


--
-- Name: climb_grad_emphases climb_grad_emphases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY climb_grad_emphases
    ADD CONSTRAINT climb_grad_emphases_pkey PRIMARY KEY (id);


--
-- Name: climb_leader_profiles climb_leader_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY climb_leader_profiles
    ADD CONSTRAINT climb_leader_profiles_pkey PRIMARY KEY (id);


--
-- Name: climb_schedules climb_schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY climb_schedules
    ADD CONSTRAINT climb_schedules_pkey PRIMARY KEY (id);


--
-- Name: climb_tags climb_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY climb_tags
    ADD CONSTRAINT climb_tags_pkey PRIMARY KEY (id);


--
-- Name: climber_educations climber_educations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY climber_educations
    ADD CONSTRAINT climber_educations_pkey PRIMARY KEY (id);


--
-- Name: climber_profiles climber_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY climber_profiles
    ADD CONSTRAINT climber_profiles_pkey PRIMARY KEY (id);


--
-- Name: education_programs education_programs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY education_programs
    ADD CONSTRAINT education_programs_pkey PRIMARY KEY (id);


--
-- Name: mountains mountains_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mountains
    ADD CONSTRAINT mountains_pkey PRIMARY KEY (id);


--
-- Name: specific_dates specific_dates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY specific_dates
    ADD CONSTRAINT specific_dates_pkey PRIMARY KEY (id);


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);


--
-- Name: index_climb_classes_on_route_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_climb_classes_on_route_id ON climb_classes USING btree (route_id);


--
-- Name: index_climb_leader_profiles_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_climb_leader_profiles_on_user_id ON climb_leader_profiles USING btree (user_id);


--
-- Name: index_climber_educations_on_education_program_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_climber_educations_on_education_program_id ON climber_educations USING btree (education_program_id);


--
-- Name: index_climber_profiles_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_climber_profiles_on_user_id ON climber_profiles USING btree (user_id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

