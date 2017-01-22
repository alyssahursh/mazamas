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
    'september',
    'october',
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
-- Name: climb_app_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE climb_app_status AS ENUM (
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
    updated_at timestamp without time zone NOT NULL
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
    bio text,
    photo_link text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
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
    year integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
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
    education_id integer,
    climber_profile_id integer
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
-- Name: climber_experiences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE climber_experiences (
    id integer NOT NULL,
    mountain character varying,
    route character varying,
    climb_leader character varying,
    role character varying,
    month integer,
    year integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    climb_type climb_type,
    climber_profile_id integer
);


--
-- Name: climber_experiences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE climber_experiences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: climber_experiences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE climber_experiences_id_seq OWNED BY climber_experiences.id;


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
-- Name: climbs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE climbs (
    id integer NOT NULL,
    description text,
    party_size integer,
    spots_available integer,
    last_updated timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    climb_status climb_status,
    route_id integer,
    climb_schedule_id integer,
    climb_tag_id integer
);


--
-- Name: climbs_educations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE climbs_educations (
    education_id integer NOT NULL,
    climb_id integer NOT NULL
);


--
-- Name: climbs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE climbs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: climbs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE climbs_id_seq OWNED BY climbs.id;


--
-- Name: educations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE educations (
    id integer NOT NULL,
    abbreviation character varying,
    name character varying,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: educations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE educations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: educations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE educations_id_seq OWNED BY educations.id;


--
-- Name: general_dates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE general_dates (
    id integer NOT NULL,
    climb_year integer,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    climb_month climb_month,
    climb_id integer
);


--
-- Name: general_dates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE general_dates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: general_dates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE general_dates_id_seq OWNED BY general_dates.id;


--
-- Name: mountains; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mountains (
    id integer NOT NULL,
    name character varying,
    latitude character varying,
    longitude character varying,
    state character varying,
    country character varying,
    continent character varying,
    summit_post_url character varying,
    google_maps_url character varying,
    elevation_feet character varying,
    elevation_meters character varying,
    summit_post_name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
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
-- Name: climb_apps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE climb_apps (
    id integer NOT NULL,
    application_date date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    climb_app_status climb_app_status,
    user_id integer,
    climb_id integer
);


--
-- Name: climb_apps_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE climb_apps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: climb_apps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE climb_apps_id_seq OWNED BY climb_apps.id;


--
-- Name: routes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE routes (
    id integer NOT NULL,
    name character varying,
    elevation_gain character varying,
    driving_distance integer,
    driving_time double precision,
    typical_duration integer,
    glaciated_peak boolean,
    rock_class integer,
    rappelling boolean,
    crevasse_rescue boolean,
    notes text,
    guidebooks text,
    phone_numbers text,
    secondary_peak integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    snow_angle snow_angle,
    typical_gear typical_gear,
    typical_season typical_season,
    climb_class_id integer,
    mountain_id integer
);


--
-- Name: routes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE routes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: routes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE routes_id_seq OWNED BY routes.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


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
    updated_at timestamp without time zone NOT NULL,
    climb_id integer
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
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    email character varying,
    emergency_contact character varying,
    emergency_phone character varying,
    address1 character varying,
    address2 character varying,
    city character varying,
    state character varying,
    zip character varying,
    phone character varying,
    birthdate date,
    age integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    membership_status membership_status,
    climber_profile_id integer,
    climb_leader_profile_id integer
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: climb_classes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY climb_classes ALTER COLUMN id SET DEFAULT nextval('climb_classes_id_seq'::regclass);


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
-- Name: climber_experiences id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY climber_experiences ALTER COLUMN id SET DEFAULT nextval('climber_experiences_id_seq'::regclass);


--
-- Name: climber_profiles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY climber_profiles ALTER COLUMN id SET DEFAULT nextval('climber_profiles_id_seq'::regclass);


--
-- Name: climbs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY climbs ALTER COLUMN id SET DEFAULT nextval('climbs_id_seq'::regclass);


--
-- Name: educations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY educations ALTER COLUMN id SET DEFAULT nextval('educations_id_seq'::regclass);


--
-- Name: general_dates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY general_dates ALTER COLUMN id SET DEFAULT nextval('general_dates_id_seq'::regclass);


--
-- Name: mountains id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY mountains ALTER COLUMN id SET DEFAULT nextval('mountains_id_seq'::regclass);


--
-- Name: climb_apps id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY climb_apps ALTER COLUMN id SET DEFAULT nextval('climb_apps_id_seq'::regclass);


--
-- Name: routes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY routes ALTER COLUMN id SET DEFAULT nextval('routes_id_seq'::regclass);


--
-- Name: specific_dates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY specific_dates ALTER COLUMN id SET DEFAULT nextval('specific_dates_id_seq'::regclass);


--
-- Name: user_roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_roles ALTER COLUMN id SET DEFAULT nextval('user_roles_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: climb_classes climb_classes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY climb_classes
    ADD CONSTRAINT climb_classes_pkey PRIMARY KEY (id);


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
-- Name: climber_experiences climber_experiences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY climber_experiences
    ADD CONSTRAINT climber_experiences_pkey PRIMARY KEY (id);


--
-- Name: climber_profiles climber_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY climber_profiles
    ADD CONSTRAINT climber_profiles_pkey PRIMARY KEY (id);


--
-- Name: climbs climbs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY climbs
    ADD CONSTRAINT climbs_pkey PRIMARY KEY (id);


--
-- Name: educations educations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY educations
    ADD CONSTRAINT educations_pkey PRIMARY KEY (id);


--
-- Name: general_dates general_dates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY general_dates
    ADD CONSTRAINT general_dates_pkey PRIMARY KEY (id);


--
-- Name: mountains mountains_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mountains
    ADD CONSTRAINT mountains_pkey PRIMARY KEY (id);


--
-- Name: climb_apps climb_apps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY climb_apps
    ADD CONSTRAINT climb_apps_pkey PRIMARY KEY (id);


--
-- Name: routes routes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY routes
    ADD CONSTRAINT routes_pkey PRIMARY KEY (id);


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
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_climb_leader_profiles_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_climb_leader_profiles_on_user_id ON climb_leader_profiles USING btree (user_id);


--
-- Name: index_climb_tags_climbs_on_climb_id_and_climb_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_climb_tags_climbs_on_climb_id_and_climb_tag_id ON climb_tags_climbs USING btree (climb_id, climb_tag_id);


--
-- Name: index_climb_tags_climbs_on_climb_tag_id_and_climb_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_climb_tags_climbs_on_climb_tag_id_and_climb_id ON climb_tags_climbs USING btree (climb_tag_id, climb_id);


--
-- Name: index_climber_educations_on_climber_profile_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_climber_educations_on_climber_profile_id ON climber_educations USING btree (climber_profile_id);


--
-- Name: index_climber_educations_on_education_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_climber_educations_on_education_id ON climber_educations USING btree (education_id);


--
-- Name: index_climber_experiences_on_climber_profile_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_climber_experiences_on_climber_profile_id ON climber_experiences USING btree (climber_profile_id);


--
-- Name: index_climber_profiles_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_climber_profiles_on_user_id ON climber_profiles USING btree (user_id);


--
-- Name: index_climbs_educations_on_climb_id_and_education_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_climbs_educations_on_climb_id_and_education_id ON climbs_educations USING btree (climb_id, education_id);


--
-- Name: index_climbs_educations_on_education_id_and_climb_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_climbs_educations_on_education_id_and_climb_id ON climbs_educations USING btree (education_id, climb_id);


--
-- Name: index_climbs_on_climb_schedule_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_climbs_on_climb_schedule_id ON climbs USING btree (climb_schedule_id);


--
-- Name: index_climbs_on_climb_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_climbs_on_climb_tag_id ON climbs USING btree (climb_tag_id);


--
-- Name: index_climbs_on_route_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_climbs_on_route_id ON climbs USING btree (route_id);


--
-- Name: index_general_dates_on_climb_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_general_dates_on_climb_id ON general_dates USING btree (climb_id);


--
-- Name: index_climb_apps_on_climb_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_climb_apps_on_climb_id ON climb_apps USING btree (climb_id);


--
-- Name: index_climb_apps_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_climb_apps_on_user_id ON climb_apps USING btree (user_id);


--
-- Name: index_routes_on_climb_class_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_routes_on_climb_class_id ON routes USING btree (climb_class_id);


--
-- Name: index_routes_on_mountain_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_routes_on_mountain_id ON routes USING btree (mountain_id);


--
-- Name: index_specific_dates_on_climb_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_specific_dates_on_climb_id ON specific_dates USING btree (climb_id);


--
-- Name: index_user_roles_users_on_user_id_and_user_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_roles_users_on_user_id_and_user_role_id ON user_roles_users USING btree (user_id, user_role_id);


--
-- Name: index_user_roles_users_on_user_role_id_and_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_roles_users_on_user_role_id_and_user_id ON user_roles_users USING btree (user_role_id, user_id);


--
-- Name: index_users_on_climb_leader_profile_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_climb_leader_profile_id ON users USING btree (climb_leader_profile_id);


--
-- Name: index_users_on_climber_profile_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_climber_profile_id ON users USING btree (climber_profile_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO schema_migrations (version) VALUES ('20170110014205');

INSERT INTO schema_migrations (version) VALUES ('20170110014221');

INSERT INTO schema_migrations (version) VALUES ('20170110023534');

INSERT INTO schema_migrations (version) VALUES ('20170110024254');

INSERT INTO schema_migrations (version) VALUES ('20170110024709');

INSERT INTO schema_migrations (version) VALUES ('20170110025316');

INSERT INTO schema_migrations (version) VALUES ('20170110025801');

INSERT INTO schema_migrations (version) VALUES ('20170110025919');

INSERT INTO schema_migrations (version) VALUES ('20170110030002');

INSERT INTO schema_migrations (version) VALUES ('20170110030051');

INSERT INTO schema_migrations (version) VALUES ('20170110030812');

INSERT INTO schema_migrations (version) VALUES ('20170110032825');

INSERT INTO schema_migrations (version) VALUES ('20170110034315');

INSERT INTO schema_migrations (version) VALUES ('20170110034829');

INSERT INTO schema_migrations (version) VALUES ('20170110035102');

INSERT INTO schema_migrations (version) VALUES ('20170110035446');

INSERT INTO schema_migrations (version) VALUES ('20170110040138');

INSERT INTO schema_migrations (version) VALUES ('20170110040501');

INSERT INTO schema_migrations (version) VALUES ('20170113033524');

