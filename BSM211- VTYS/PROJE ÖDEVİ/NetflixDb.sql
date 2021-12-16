--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

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
-- Name: ActorAdd(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ActorAdd"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW."FirstName" = UPPER(NEW."FirstName"); 
    NEW."LastName" = UPPER(NEW."LastName"); 
    RETURN NEW;
END;
$$;


ALTER FUNCTION public."ActorAdd"() OWNER TO postgres;

--
-- Name: DepartmentAdd(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."DepartmentAdd"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW."Name" = UPPER(NEW."Name"); 
    RETURN NEW;
END;
$$;


ALTER FUNCTION public."DepartmentAdd"() OWNER TO postgres;

--
-- Name: DirectorAdd(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."DirectorAdd"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW."FirstName" = UPPER(NEW."FirstName"); 
    NEW."LastName" = UPPER(NEW."LastName"); 
    RETURN NEW;
END;
$$;


ALTER FUNCTION public."DirectorAdd"() OWNER TO postgres;

--
-- Name: EmployeeAdd(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."EmployeeAdd"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW."FirstName" = UPPER(NEW."FirstName"); 
    NEW."LastName" = UPPER(NEW."LastName"); 
    NEW."Phone" = LTRIM(NEW."Phone"); 

    RETURN NEW;
END;
$$;


ALTER FUNCTION public."EmployeeAdd"() OWNER TO postgres;

--
-- Name: ManagerAdd(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ManagerAdd"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW."FirstName" = UPPER(NEW."FirstName"); 
    NEW."LastName" = UPPER(NEW."LastName"); 
    RETURN NEW;
END;
$$;


ALTER FUNCTION public."ManagerAdd"() OWNER TO postgres;

--
-- Name: MovieAdd(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."MovieAdd"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW."MovieName" = UPPER(NEW."MovieName"); 
    RETURN NEW;
END;
$$;


ALTER FUNCTION public."MovieAdd"() OWNER TO postgres;

--
-- Name: PlanAdd(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."PlanAdd"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW."Name" = UPPER(NEW."Name"); 
    RETURN NEW;
END;
$$;


ALTER FUNCTION public."PlanAdd"() OWNER TO postgres;

--
-- Name: TypeAdd(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."TypeAdd"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW."Name" = UPPER(NEW."Name"); 
    RETURN NEW;
END;
$$;


ALTER FUNCTION public."TypeAdd"() OWNER TO postgres;

--
-- Name: employeeLeft(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."employeeLeft"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF (TG_OP = 'DELETE') THEN
    INSERT INTO "OldEmployees"("Id","FirstName","LastName","DepartmentId","Email","Phone","QuitDate")
    VALUES(OLD."Id",OLD."FirstName",OLD."LastName",OLD."DepartmentId",OLD."Email",OLD."Phone",CURRENT_TIMESTAMP::TIMESTAMP);
    RETURN OLD;
    END IF;
    RETURN NULL;
END;
$$;


ALTER FUNCTION public."employeeLeft"() OWNER TO postgres;

--
-- Name: getemployeebydepartmentid(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getemployeebydepartmentid(departmentid integer) RETURNS TABLE(id integer, ad character varying, soyad character varying, telefon character varying, mail character varying, departmanno integer, "Şehirno" integer, "İlçeno" integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
RETURN QUERY SELECT "Id","FirstName","LastName","Phone","Email","DepartmentId","CityId","CountyId" from "Employees" where "DepartmentId"=departmentId;
END;
$$;


ALTER FUNCTION public.getemployeebydepartmentid(departmentid integer) OWNER TO postgres;

--
-- Name: getmovieactorsbymovieid(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getmovieactorsbymovieid(movieid integer) RETURNS TABLE(id integer, karakter character varying, filmno integer, oyuncuno integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
RETURN QUERY SELECT "Id","CharacterName","MovieId","ActorId" from "MovieActors" where "MovieId"=movieId;
END;
$$;


ALTER FUNCTION public.getmovieactorsbymovieid(movieid integer) OWNER TO postgres;

--
-- Name: getmoviebydirectorid(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getmoviebydirectorid(directorid integer) RETURNS TABLE(id integer, film character varying, tarih date, yonetmenno integer, ekleyenno integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
RETURN QUERY SELECT "Id","MovieName","ReleaseDate","DirectorId","EmployeeId" from "Movies" where "DirectorId"=directorId;
END;
$$;


ALTER FUNCTION public.getmoviebydirectorid(directorid integer) OWNER TO postgres;

--
-- Name: getoldemployeebydepartmentid(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getoldemployeebydepartmentid(departmentid integer) RETURNS TABLE(id integer, ad character varying, soyad character varying, telefon character varying, mail character varying, departmanno integer, "ayrılmatarihi" timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
RETURN QUERY SELECT "Id","FirstName","LastName","Phone","Email","DepartmentId","QuitDate" from "OldEmployees" where "DepartmentId"=departmentId;
END;
$$;


ALTER FUNCTION public.getoldemployeebydepartmentid(departmentid integer) OWNER TO postgres;

--
-- Name: planPriceChanged(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."planPriceChanged"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW."Price" <> OLD."Price" THEN
        INSERT INTO "OldPlanPrices"("PlanId", "OldPrice","UpdatedDate")
        VALUES(OLD."Id", OLD."Price", CURRENT_TIMESTAMP::TIMESTAMP);
    END IF;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public."planPriceChanged"() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Actors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Actors" (
    "Id" integer NOT NULL,
    "FirstName" character varying(50) NOT NULL,
    "LastName" character varying(50) NOT NULL,
    "ManagerId" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."Actors" OWNER TO postgres;

--
-- Name: MovieActors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MovieActors" (
    "Id" integer NOT NULL,
    "CharacterName" character varying(50) NOT NULL,
    "MovieId" integer NOT NULL,
    "ActorId" integer NOT NULL
);


ALTER TABLE public."MovieActors" OWNER TO postgres;

--
-- Name: Movies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Movies" (
    "Id" integer NOT NULL,
    "MovieName" character varying(50) NOT NULL,
    "ReleaseDate" date DEFAULT CURRENT_DATE NOT NULL,
    "DirectorId" integer DEFAULT 0 NOT NULL,
    "EmployeeId" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."Movies" OWNER TO postgres;

--
-- Name: ActorMovies; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public."ActorMovies" AS
 SELECT a."Id",
    m."MovieName",
    ma."CharacterName"
   FROM ((public."Actors" a
     JOIN public."MovieActors" ma ON ((ma."ActorId" = a."Id")))
     JOIN public."Movies" m ON ((m."Id" = ma."MovieId")));


ALTER TABLE public."ActorMovies" OWNER TO postgres;

--
-- Name: Actors_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Actors_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Actors_Id_seq" OWNER TO postgres;

--
-- Name: Actors_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Actors_Id_seq" OWNED BY public."Actors"."Id";


--
-- Name: Cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Cities" (
    "Id" integer NOT NULL,
    "Name" character varying(50) NOT NULL
);


ALTER TABLE public."Cities" OWNER TO postgres;

--
-- Name: Cities_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Cities_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Cities_Id_seq" OWNER TO postgres;

--
-- Name: Cities_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Cities_Id_seq" OWNED BY public."Cities"."Id";


--
-- Name: Counties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Counties" (
    "Id" integer NOT NULL,
    "CityId" integer NOT NULL,
    "Name" character varying(50) NOT NULL
);


ALTER TABLE public."Counties" OWNER TO postgres;

--
-- Name: Counties_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Counties_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Counties_Id_seq" OWNER TO postgres;

--
-- Name: Counties_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Counties_Id_seq" OWNED BY public."Counties"."Id";


--
-- Name: Departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Departments" (
    "Id" integer NOT NULL,
    "Name" character varying(25) NOT NULL
);


ALTER TABLE public."Departments" OWNER TO postgres;

--
-- Name: Departments_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Departments_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Departments_Id_seq" OWNER TO postgres;

--
-- Name: Departments_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Departments_Id_seq" OWNED BY public."Departments"."Id";


--
-- Name: Directors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Directors" (
    "Id" integer NOT NULL,
    "FirstName" character varying(50) NOT NULL,
    "LastName" character varying(50) NOT NULL
);


ALTER TABLE public."Directors" OWNER TO postgres;

--
-- Name: Directors_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Directors_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Directors_Id_seq" OWNER TO postgres;

--
-- Name: Directors_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Directors_Id_seq" OWNED BY public."Directors"."Id";


--
-- Name: Employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Employees" (
    "Id" integer NOT NULL,
    "FirstName" character varying(50) NOT NULL,
    "LastName" character varying(50) NOT NULL,
    "Phone" character varying(11) NOT NULL,
    "Email" character varying(255) NOT NULL,
    "DepartmentId" integer NOT NULL,
    "CityId" integer NOT NULL,
    "CountyId" integer NOT NULL
);


ALTER TABLE public."Employees" OWNER TO postgres;

--
-- Name: Employees_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Employees_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Employees_Id_seq" OWNER TO postgres;

--
-- Name: Employees_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Employees_Id_seq" OWNED BY public."Employees"."Id";


--
-- Name: Managers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Managers" (
    "Id" integer NOT NULL,
    "FirstName" character varying(50) NOT NULL,
    "LastName" character varying(50) NOT NULL
);


ALTER TABLE public."Managers" OWNER TO postgres;

--
-- Name: Managers_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Managers_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Managers_Id_seq" OWNER TO postgres;

--
-- Name: Managers_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Managers_Id_seq" OWNED BY public."Managers"."Id";


--
-- Name: MovieActors_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."MovieActors_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MovieActors_Id_seq" OWNER TO postgres;

--
-- Name: MovieActors_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."MovieActors_Id_seq" OWNED BY public."MovieActors"."Id";


--
-- Name: MovieTypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MovieTypes" (
    "Id" integer NOT NULL,
    "MovieId" integer NOT NULL,
    "TypeId" integer NOT NULL
);


ALTER TABLE public."MovieTypes" OWNER TO postgres;

--
-- Name: Types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Types" (
    "Id" integer NOT NULL,
    "Name" character varying(25) NOT NULL
);


ALTER TABLE public."Types" OWNER TO postgres;

--
-- Name: MovieTypesSearch; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public."MovieTypesSearch" AS
 SELECT mt."Id",
    mt."MovieId",
    mt."TypeId",
    m."MovieName",
    t."Name"
   FROM ((public."MovieTypes" mt
     JOIN public."Movies" m ON ((mt."MovieId" = m."Id")))
     JOIN public."Types" t ON ((t."Id" = mt."TypeId")));


ALTER TABLE public."MovieTypesSearch" OWNER TO postgres;

--
-- Name: MovieTypes_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."MovieTypes_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MovieTypes_Id_seq" OWNER TO postgres;

--
-- Name: MovieTypes_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."MovieTypes_Id_seq" OWNED BY public."MovieTypes"."Id";


--
-- Name: Movies_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Movies_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Movies_Id_seq" OWNER TO postgres;

--
-- Name: Movies_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Movies_Id_seq" OWNED BY public."Movies"."Id";


--
-- Name: OldEmployees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OldEmployees" (
    "Id" integer NOT NULL,
    "FirstName" character varying(50) NOT NULL,
    "LastName" character varying(50) NOT NULL,
    "Phone" character varying(11) NOT NULL,
    "Email" character varying(255) NOT NULL,
    "DepartmentId" integer DEFAULT 0 NOT NULL,
    "QuitDate" timestamp without time zone NOT NULL
);


ALTER TABLE public."OldEmployees" OWNER TO postgres;

--
-- Name: OldEmployees_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."OldEmployees_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."OldEmployees_Id_seq" OWNER TO postgres;

--
-- Name: OldEmployees_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."OldEmployees_Id_seq" OWNED BY public."OldEmployees"."Id";


--
-- Name: OldPlanPrices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OldPlanPrices" (
    "Id" integer NOT NULL,
    "PlanId" integer NOT NULL,
    "OldPrice" numeric NOT NULL,
    "UpdatedDate" timestamp without time zone NOT NULL
);


ALTER TABLE public."OldPlanPrices" OWNER TO postgres;

--
-- Name: OldPlanPrices_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."OldPlanPrices_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."OldPlanPrices_Id_seq" OWNER TO postgres;

--
-- Name: OldPlanPrices_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."OldPlanPrices_Id_seq" OWNED BY public."OldPlanPrices"."Id";


--
-- Name: Plans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Plans" (
    "Id" integer NOT NULL,
    "Name" character varying(50) NOT NULL,
    "Price" numeric NOT NULL,
    "VideoQuality" character varying(15) NOT NULL
);


ALTER TABLE public."Plans" OWNER TO postgres;

--
-- Name: Plans_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Plans_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Plans_Id_seq" OWNER TO postgres;

--
-- Name: Plans_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Plans_Id_seq" OWNED BY public."Plans"."Id";


--
-- Name: Subscribers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Subscribers" (
    "Id" integer NOT NULL,
    "FirstName" character varying(50) NOT NULL,
    "LastName" character varying(50) NOT NULL,
    "Phone" character varying(11) NOT NULL,
    "Email" character varying(255) NOT NULL,
    "PlanId" integer DEFAULT 0 NOT NULL,
    "CityId" integer NOT NULL,
    "CountyId" integer NOT NULL
);


ALTER TABLE public."Subscribers" OWNER TO postgres;

--
-- Name: Subscribers_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Subscribers_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Subscribers_Id_seq" OWNER TO postgres;

--
-- Name: Subscribers_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Subscribers_Id_seq" OWNED BY public."Subscribers"."Id";


--
-- Name: Types_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Types_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Types_Id_seq" OWNER TO postgres;

--
-- Name: Types_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Types_Id_seq" OWNED BY public."Types"."Id";


--
-- Name: Actors Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Actors" ALTER COLUMN "Id" SET DEFAULT nextval('public."Actors_Id_seq"'::regclass);


--
-- Name: Cities Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cities" ALTER COLUMN "Id" SET DEFAULT nextval('public."Cities_Id_seq"'::regclass);


--
-- Name: Counties Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Counties" ALTER COLUMN "Id" SET DEFAULT nextval('public."Counties_Id_seq"'::regclass);


--
-- Name: Departments Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Departments" ALTER COLUMN "Id" SET DEFAULT nextval('public."Departments_Id_seq"'::regclass);


--
-- Name: Directors Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Directors" ALTER COLUMN "Id" SET DEFAULT nextval('public."Directors_Id_seq"'::regclass);


--
-- Name: Employees Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Employees" ALTER COLUMN "Id" SET DEFAULT nextval('public."Employees_Id_seq"'::regclass);


--
-- Name: Managers Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Managers" ALTER COLUMN "Id" SET DEFAULT nextval('public."Managers_Id_seq"'::regclass);


--
-- Name: MovieActors Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MovieActors" ALTER COLUMN "Id" SET DEFAULT nextval('public."MovieActors_Id_seq"'::regclass);


--
-- Name: MovieTypes Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MovieTypes" ALTER COLUMN "Id" SET DEFAULT nextval('public."MovieTypes_Id_seq"'::regclass);


--
-- Name: Movies Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Movies" ALTER COLUMN "Id" SET DEFAULT nextval('public."Movies_Id_seq"'::regclass);


--
-- Name: OldEmployees Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OldEmployees" ALTER COLUMN "Id" SET DEFAULT nextval('public."OldEmployees_Id_seq"'::regclass);


--
-- Name: OldPlanPrices Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OldPlanPrices" ALTER COLUMN "Id" SET DEFAULT nextval('public."OldPlanPrices_Id_seq"'::regclass);


--
-- Name: Plans Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Plans" ALTER COLUMN "Id" SET DEFAULT nextval('public."Plans_Id_seq"'::regclass);


--
-- Name: Subscribers Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Subscribers" ALTER COLUMN "Id" SET DEFAULT nextval('public."Subscribers_Id_seq"'::regclass);


--
-- Name: Types Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Types" ALTER COLUMN "Id" SET DEFAULT nextval('public."Types_Id_seq"'::regclass);


--
-- Data for Name: Actors; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Actors" VALUES
	(1, 'CEM', 'YıLMAZ', 1),
	(2, 'RASIM', 'ÖZTEKIN', 8),
	(3, 'ÖZKAN', 'UĞUR', 1),
	(4, 'OZAN', 'GÜVEN', 1),
	(5, 'YıLMAZ', 'ERDOĞAN', 4),
	(6, 'ŞAFAK', 'SEZER', 5),
	(7, 'ERDAL', 'BEŞIKCIOĞLU', 2),
	(8, 'ENGIN', 'GÜNAYDıN', 6),
	(9, 'ÖZGE', 'ÖZBERK', 3),
	(10, 'NIL', 'KARAIBRAHIMGIL', 3),
	(11, 'BURCU', 'BIRICIK', 3),
	(12, 'AYDEMIR', 'AKBAŞ', 6),
	(13, 'SERKAN', 'ŞENGÜL', 6),
	(14, 'ARAS BULUT', 'İYNEMLI', 8),
	(15, 'SARP', 'AKKAYA', 8),
	(16, 'İLKER', 'AKSUM', 7),
	(17, 'TOLGA', 'ÇEVIK', 4),
	(18, 'ÖZGÜ', 'NAMAL', 4),
	(19, 'ERDAL', 'TOSUN', 5),
	(20, 'ÖNER', 'ERKAN', 6);


--
-- Data for Name: Cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Cities" VALUES
	(0, 'Seçiniz'),
	(1, 'ADANA'),
	(2, 'ADIYAMAN'),
	(3, 'AFYON'),
	(4, 'AĞRI'),
	(5, 'AMASYA'),
	(6, 'ANKARA'),
	(7, 'ANTALYA'),
	(8, 'ARTVİN'),
	(9, 'AYDIN'),
	(10, 'BALIKESİR'),
	(11, 'BİLECİK'),
	(12, 'BİNGÖL'),
	(13, 'BİTLİS'),
	(14, 'BOLU'),
	(15, 'BURDUR'),
	(16, 'BURSA'),
	(17, 'ÇANAKKALE'),
	(18, 'ÇANKIRI'),
	(19, 'ÇORUM'),
	(20, 'DENİZLİ'),
	(21, 'DİYARBAKIR'),
	(22, 'EDİRNE'),
	(23, 'ELAZIĞ'),
	(24, 'ERZİNCAN'),
	(25, 'ERZURUM'),
	(26, 'ESKİŞEHİR'),
	(27, 'GAZİANTEP'),
	(28, 'GİRESUN'),
	(29, 'GÜMÜŞHANE'),
	(30, 'HAKKARİ'),
	(31, 'HATAY'),
	(32, 'ISPARTA'),
	(33, 'İÇEL'),
	(34, 'İSTANBUL'),
	(35, 'İZMİR'),
	(36, 'KARS'),
	(37, 'KASTAMONU'),
	(38, 'KAYSERİ'),
	(39, 'KIRKLARELİ'),
	(40, 'KIRŞEHİR'),
	(41, 'KOCAELİ'),
	(42, 'KONYA'),
	(43, 'KÜTAHYA'),
	(44, 'MALATYA'),
	(45, 'MANİSA'),
	(46, 'KAHRAMANMARAŞ'),
	(47, 'MARDİN'),
	(48, 'MUĞLA'),
	(49, 'MUŞ'),
	(50, 'NEVŞEHİR'),
	(51, 'NİĞDE'),
	(52, 'ORDU'),
	(53, 'RİZE'),
	(54, 'SAKARYA'),
	(55, 'SAMSUN'),
	(56, 'SİİRT'),
	(57, 'SİNOP'),
	(58, 'SİVAS'),
	(59, 'TEKİRDAĞ'),
	(60, 'TOKAT'),
	(61, 'TRABZON'),
	(62, 'TUNCELİ'),
	(63, 'ŞANLIURFA'),
	(64, 'UŞAK'),
	(65, 'VAN'),
	(66, 'YOZGAT'),
	(67, 'ZONGULDAK'),
	(68, 'AKSARAY'),
	(69, 'BAYBURT'),
	(70, 'KARAMAN'),
	(71, 'KIRIKKALE'),
	(72, 'BATMAN'),
	(73, 'ŞIRNAK'),
	(74, 'BARTIN'),
	(75, 'ARDAHAN'),
	(76, 'IĞDIR'),
	(77, 'YALOVA'),
	(78, 'KARABÜK'),
	(79, 'KİLİS'),
	(80, 'OSMANİYE'),
	(81, 'DÜZCE');


--
-- Data for Name: Counties; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Counties" VALUES
	(0, 0, 'Seçiniz'),
	(1, 1, 'ALADAĞ'),
	(2, 1, 'CEYHAN'),
	(3, 1, 'ÇUKUROVA'),
	(4, 1, 'FEKE'),
	(5, 1, 'İMAMOĞLU'),
	(6, 1, 'KARAİSALI'),
	(7, 1, 'KARATAŞ'),
	(8, 1, 'KOZAN'),
	(9, 1, 'POZANTI'),
	(10, 1, 'SAİMBEYLİ'),
	(11, 1, 'SARIÇAM'),
	(12, 1, 'SEYHAN'),
	(13, 1, 'TUFANBEYLİ'),
	(14, 1, 'YUMURTALIK'),
	(15, 1, 'YÜREĞİR'),
	(16, 2, 'BESNİ'),
	(17, 2, 'ÇELİKHAN'),
	(18, 2, 'GERGER'),
	(19, 2, 'GÖLBAŞI'),
	(20, 2, 'KAHTA'),
	(21, 2, 'MERKEZ'),
	(22, 2, 'SAMSAT'),
	(23, 2, 'SİNCİK'),
	(24, 2, 'TUT'),
	(25, 3, 'BAŞMAKÇI'),
	(26, 3, 'BAYAT'),
	(27, 3, 'BOLVADİN'),
	(28, 3, 'ÇAY'),
	(29, 3, 'ÇOBANLAR'),
	(30, 3, 'DAZKIRI'),
	(31, 3, 'DİNAR'),
	(32, 3, 'EMİRDAĞ'),
	(33, 3, 'EVCİLER'),
	(34, 3, 'HOCALAR'),
	(35, 3, 'İHSANİYE'),
	(36, 3, 'İSCEHİSAR'),
	(37, 3, 'KIZILÖREN'),
	(38, 3, 'MERKEZ'),
	(39, 3, 'SANDIKLI'),
	(40, 3, 'SİNANPAŞA'),
	(41, 3, 'SULTANDAĞI'),
	(42, 3, 'ŞUHUT'),
	(43, 4, 'DİYADİN'),
	(44, 4, 'DOĞUBAYAZIT'),
	(45, 4, 'ELEŞKİRT'),
	(46, 4, 'HAMUR'),
	(47, 4, 'MERKEZ'),
	(48, 4, 'PATNOS'),
	(49, 4, 'TAŞLIÇAY'),
	(50, 4, 'TUTAK'),
	(51, 68, 'AĞAÇÖREN'),
	(52, 68, 'ESKİL'),
	(53, 68, 'GÜLAĞAÇ'),
	(54, 68, 'GÜZELYURT'),
	(55, 68, 'MERKEZ'),
	(56, 68, 'ORTAKÖY'),
	(57, 68, 'SARIYAHŞİ'),
	(58, 68, 'SULTANHANI'),
	(59, 5, 'GÖYNÜCEK'),
	(60, 5, 'GÜMÜŞHACIKÖY'),
	(61, 5, 'HAMAMÖZÜ'),
	(62, 5, 'MERKEZ'),
	(63, 5, 'MERZİFON'),
	(64, 5, 'SULUOVA'),
	(65, 5, 'TAŞOVA'),
	(66, 6, 'AKYURT'),
	(67, 6, 'ALTINDAĞ'),
	(68, 6, 'AYAŞ'),
	(69, 6, 'BALA'),
	(70, 6, 'BEYPAZARI'),
	(71, 6, 'ÇAMLIDERE'),
	(72, 6, 'ÇANKAYA'),
	(73, 6, 'ÇUBUK'),
	(74, 6, 'ELMADAĞ'),
	(75, 6, 'ETİMESGUT'),
	(76, 6, 'EVREN'),
	(77, 6, 'GÖLBAŞI'),
	(78, 6, 'GÜDÜL'),
	(79, 6, 'HAYMANA'),
	(80, 6, 'KAHRAMANKAZAN'),
	(81, 6, 'KALECİK'),
	(82, 6, 'KEÇİÖREN'),
	(83, 6, 'KIZILCAHAMAM'),
	(84, 6, 'MAMAK'),
	(85, 6, 'NALLIHAN'),
	(86, 6, 'POLATLI'),
	(87, 6, 'PURSAKLAR'),
	(88, 6, 'SİNCAN'),
	(89, 6, 'ŞEREFLİKOÇHİSAR'),
	(90, 6, 'YENİMAHALLE'),
	(91, 7, 'AKSEKİ'),
	(92, 7, 'AKSU'),
	(93, 7, 'ALANYA'),
	(94, 7, 'DEMRE'),
	(95, 7, 'DÖŞEMEALTI'),
	(96, 7, 'ELMALI'),
	(97, 7, 'FİNİKE'),
	(98, 7, 'GAZİPAŞA'),
	(99, 7, 'GÜNDOĞMUŞ'),
	(100, 7, 'İBRADI'),
	(101, 7, 'KAŞ'),
	(102, 7, 'KEMER'),
	(103, 7, 'KEPEZ'),
	(104, 7, 'KONYAALTI'),
	(105, 7, 'KORKUTELİ'),
	(106, 7, 'KUMLUCA'),
	(107, 7, 'MANAVGAT'),
	(108, 7, 'MURATPAŞA'),
	(109, 7, 'SERİK'),
	(110, 75, 'ÇILDIR'),
	(111, 75, 'DAMAL'),
	(112, 75, 'GÖLE'),
	(113, 75, 'HANAK'),
	(114, 75, 'MERKEZ'),
	(115, 75, 'POSOF'),
	(116, 8, 'ARDANUÇ'),
	(117, 8, 'ARHAVİ'),
	(118, 8, 'BORÇKA'),
	(119, 8, 'HOPA'),
	(120, 8, 'KEMALPAŞA'),
	(121, 8, 'MERKEZ'),
	(122, 8, 'MURGUL'),
	(123, 8, 'ŞAVŞAT'),
	(124, 8, 'YUSUFELİ'),
	(125, 9, 'BOZDOĞAN'),
	(126, 9, 'BUHARKENT'),
	(127, 9, 'ÇİNE'),
	(128, 9, 'DİDİM'),
	(129, 9, 'EFELER'),
	(130, 9, 'GERMENCİK'),
	(131, 9, 'İNCİRLİOVA'),
	(132, 9, 'KARACASU'),
	(133, 9, 'KARPUZLU'),
	(134, 9, 'KOÇARLI'),
	(135, 9, 'KÖŞK'),
	(136, 9, 'KUŞADASI'),
	(137, 9, 'KUYUCAK'),
	(138, 9, 'NAZİLLİ'),
	(139, 9, 'SÖKE'),
	(140, 9, 'SULTANHİSAR'),
	(141, 9, 'YENİPAZAR'),
	(142, 10, 'ALTIEYLÜL'),
	(143, 10, 'AYVALIK'),
	(144, 10, 'BALYA'),
	(145, 10, 'BANDIRMA'),
	(146, 10, 'BİGADİÇ'),
	(147, 10, 'BURHANİYE'),
	(148, 10, 'DURSUNBEY'),
	(149, 10, 'EDREMİT'),
	(150, 10, 'ERDEK'),
	(151, 10, 'GÖMEÇ'),
	(152, 10, 'GÖNEN'),
	(153, 10, 'HAVRAN'),
	(154, 10, 'İVRİNDİ'),
	(155, 10, 'KARESİ'),
	(156, 10, 'KEPSUT'),
	(157, 10, 'MANYAS'),
	(158, 10, 'MARMARA'),
	(159, 10, 'SAVAŞTEPE'),
	(160, 10, 'SINDIRGI'),
	(161, 10, 'SUSURLUK'),
	(162, 74, 'AMASRA'),
	(163, 74, 'KURUCAŞİLE'),
	(164, 74, 'MERKEZ'),
	(165, 74, 'ULUS'),
	(166, 72, 'BEŞİRİ'),
	(167, 72, 'GERCÜŞ'),
	(168, 72, 'HASANKEYF'),
	(169, 72, 'KOZLUK'),
	(170, 72, 'MERKEZ'),
	(171, 72, 'SASON'),
	(172, 69, 'AYDINTEPE'),
	(173, 69, 'DEMİRÖZÜ'),
	(174, 69, 'MERKEZ'),
	(175, 11, 'BOZÜYÜK'),
	(176, 11, 'GÖLPAZARI'),
	(177, 11, 'İNHİSAR'),
	(178, 11, 'MERKEZ'),
	(179, 11, 'OSMANELİ'),
	(180, 11, 'PAZARYERİ'),
	(181, 11, 'SÖĞÜT'),
	(182, 11, 'YENİPAZAR'),
	(183, 12, 'ADAKLI'),
	(184, 12, 'GENÇ'),
	(185, 12, 'KARLIOVA'),
	(186, 12, 'KİĞI'),
	(187, 12, 'MERKEZ'),
	(188, 12, 'SOLHAN'),
	(189, 12, 'YAYLADERE'),
	(190, 12, 'YEDİSU'),
	(191, 13, 'ADİLCEVAZ'),
	(192, 13, 'AHLAT'),
	(193, 13, 'GÜROYMAK'),
	(194, 13, 'HİZAN'),
	(195, 13, 'MERKEZ'),
	(196, 13, 'MUTKİ'),
	(197, 13, 'TATVAN'),
	(198, 14, 'DÖRTDİVAN'),
	(199, 14, 'GEREDE'),
	(200, 14, 'GÖYNÜK'),
	(201, 14, 'KIBRISCIK'),
	(202, 14, 'MENGEN'),
	(203, 14, 'MERKEZ'),
	(204, 14, 'MUDURNU'),
	(205, 14, 'SEBEN'),
	(206, 14, 'YENİÇAĞA'),
	(207, 15, 'AĞLASUN'),
	(208, 15, 'ALTINYAYLA'),
	(209, 15, 'BUCAK'),
	(210, 15, 'ÇAVDIR'),
	(211, 15, 'ÇELTİKÇİ'),
	(212, 15, 'GÖLHİSAR'),
	(213, 15, 'KARAMANLI'),
	(214, 15, 'KEMER'),
	(215, 15, 'MERKEZ'),
	(216, 15, 'TEFENNİ'),
	(217, 15, 'YEŞİLOVA'),
	(218, 16, 'BÜYÜKORHAN'),
	(219, 16, 'GEMLİK'),
	(220, 16, 'GÜRSU'),
	(221, 16, 'HARMANCIK'),
	(222, 16, 'İNEGÖL'),
	(223, 16, 'İZNİK'),
	(224, 16, 'KARACABEY'),
	(225, 16, 'KELES'),
	(226, 16, 'KESTEL'),
	(227, 16, 'MUDANYA'),
	(228, 16, 'MUSTAFAKEMALPAŞA'),
	(229, 16, 'NİLÜFER'),
	(230, 16, 'ORHANELİ'),
	(231, 16, 'ORHANGAZİ'),
	(232, 16, 'OSMANGAZİ'),
	(233, 16, 'YENİŞEHİR'),
	(234, 16, 'YILDIRIM'),
	(235, 17, 'AYVACIK'),
	(236, 17, 'BAYRAMİÇ'),
	(237, 17, 'BİGA'),
	(238, 17, 'BOZCAADA'),
	(239, 17, 'ÇAN'),
	(240, 17, 'ECEABAT'),
	(241, 17, 'EZİNE'),
	(242, 17, 'GELİBOLU'),
	(243, 17, 'GÖKÇEADA'),
	(244, 17, 'LAPSEKİ'),
	(245, 17, 'MERKEZ'),
	(246, 17, 'YENİCE'),
	(247, 18, 'ATKARACALAR'),
	(248, 18, 'BAYRAMÖREN'),
	(249, 18, 'ÇERKEŞ');
INSERT INTO public."Counties" VALUES
	(250, 18, 'ELDİVAN'),
	(251, 18, 'ILGAZ'),
	(252, 18, 'KIZILIRMAK'),
	(253, 18, 'KORGUN'),
	(254, 18, 'KURŞUNLU'),
	(255, 18, 'MERKEZ'),
	(256, 18, 'ORTA'),
	(257, 18, 'ŞABANÖZÜ'),
	(258, 18, 'YAPRAKLI'),
	(259, 19, 'ALACA'),
	(260, 19, 'BAYAT'),
	(261, 19, 'BOĞAZKALE'),
	(262, 19, 'DODURGA'),
	(263, 19, 'İSKİLİP'),
	(264, 19, 'KARGI'),
	(265, 19, 'LAÇİN'),
	(266, 19, 'MECİTÖZÜ'),
	(267, 19, 'MERKEZ'),
	(268, 19, 'OĞUZLAR'),
	(269, 19, 'ORTAKÖY'),
	(270, 19, 'OSMANCIK'),
	(271, 19, 'SUNGURLU'),
	(272, 19, 'UĞURLUDAĞ'),
	(273, 20, 'ACIPAYAM'),
	(274, 20, 'BABADAĞ'),
	(275, 20, 'BAKLAN'),
	(276, 20, 'BEKİLLİ'),
	(277, 20, 'BEYAĞAÇ'),
	(278, 20, 'BOZKURT'),
	(279, 20, 'BULDAN'),
	(280, 20, 'ÇAL'),
	(281, 20, 'ÇAMELİ'),
	(282, 20, 'ÇARDAK'),
	(283, 20, 'ÇİVRİL'),
	(284, 20, 'GÜNEY'),
	(285, 20, 'HONAZ'),
	(286, 20, 'KALE'),
	(287, 20, 'MERKEZEFENDİ'),
	(288, 20, 'PAMUKKALE'),
	(289, 20, 'SARAYKÖY'),
	(290, 20, 'SERİNHİSAR'),
	(291, 20, 'TAVAS'),
	(292, 21, 'BAĞLAR'),
	(293, 21, 'BİSMİL'),
	(294, 21, 'ÇERMİK'),
	(295, 21, 'ÇINAR'),
	(296, 21, 'ÇÜNGÜŞ'),
	(297, 21, 'DİCLE'),
	(298, 21, 'EĞİL'),
	(299, 21, 'ERGANİ'),
	(300, 21, 'HANİ'),
	(301, 21, 'HAZRO'),
	(302, 21, 'KAYAPINAR'),
	(303, 21, 'KOCAKÖY'),
	(304, 21, 'KULP'),
	(305, 21, 'LİCE'),
	(306, 21, 'SİLVAN'),
	(307, 21, 'SUR'),
	(308, 21, 'YENİŞEHİR'),
	(309, 81, 'AKÇAKOCA'),
	(310, 81, 'CUMAYERİ'),
	(311, 81, 'ÇİLİMLİ'),
	(312, 81, 'GÖLYAKA'),
	(313, 81, 'GÜMÜŞOVA'),
	(314, 81, 'KAYNAŞLI'),
	(315, 81, 'MERKEZ'),
	(316, 81, 'YIĞILCA'),
	(317, 22, 'ENEZ'),
	(318, 22, 'HAVSA'),
	(319, 22, 'İPSALA'),
	(320, 22, 'KEŞAN'),
	(321, 22, 'LALAPAŞA'),
	(322, 22, 'MERİÇ'),
	(323, 22, 'MERKEZ'),
	(324, 22, 'SÜLOĞLU'),
	(325, 22, 'UZUNKÖPRÜ'),
	(326, 23, 'AĞIN'),
	(327, 23, 'ALACAKAYA'),
	(328, 23, 'ARICAK'),
	(329, 23, 'BASKİL'),
	(330, 23, 'KARAKOÇAN'),
	(331, 23, 'KEBAN'),
	(332, 23, 'KOVANCILAR'),
	(333, 23, 'MADEN'),
	(334, 23, 'MERKEZ'),
	(335, 23, 'PALU'),
	(336, 23, 'SİVRİCE'),
	(337, 24, 'ÇAYIRLI'),
	(338, 24, 'İLİÇ'),
	(339, 24, 'KEMAH'),
	(340, 24, 'KEMALİYE'),
	(341, 24, 'MERKEZ'),
	(342, 24, 'OTLUKBELİ'),
	(343, 24, 'REFAHİYE'),
	(344, 24, 'TERCAN'),
	(345, 24, 'ÜZÜMLÜ'),
	(346, 25, 'AŞKALE'),
	(347, 25, 'AZİZİYE'),
	(348, 25, 'ÇAT'),
	(349, 25, 'HINIS'),
	(350, 25, 'HORASAN'),
	(351, 25, 'İSPİR'),
	(352, 25, 'KARAÇOBAN'),
	(353, 25, 'KARAYAZI'),
	(354, 25, 'KÖPRÜKÖY'),
	(355, 25, 'NARMAN'),
	(356, 25, 'OLTU'),
	(357, 25, 'OLUR'),
	(358, 25, 'PALANDÖKEN'),
	(359, 25, 'PASİNLER'),
	(360, 25, 'PAZARYOLU'),
	(361, 25, 'ŞENKAYA'),
	(362, 25, 'TEKMAN'),
	(363, 25, 'TORTUM'),
	(364, 25, 'UZUNDERE'),
	(365, 25, 'YAKUTİYE'),
	(366, 26, 'ALPU'),
	(367, 26, 'BEYLİKOVA'),
	(368, 26, 'ÇİFTELER'),
	(369, 26, 'GÜNYÜZÜ'),
	(370, 26, 'HAN'),
	(371, 26, 'İNÖNÜ'),
	(372, 26, 'MAHMUDİYE'),
	(373, 26, 'MİHALGAZİ'),
	(374, 26, 'MİHALIÇÇIK'),
	(375, 26, 'ODUNPAZARI'),
	(376, 26, 'SARICAKAYA'),
	(377, 26, 'SEYİTGAZİ'),
	(378, 26, 'SİVRİHİSAR'),
	(379, 26, 'TEPEBAŞI'),
	(380, 27, 'ARABAN'),
	(381, 27, 'İSLAHİYE'),
	(382, 27, 'KARKAMIŞ'),
	(383, 27, 'NİZİP'),
	(384, 27, 'NURDAĞI'),
	(385, 27, 'OĞUZELİ'),
	(386, 27, 'ŞAHİNBEY'),
	(387, 27, 'ŞEHİTKAMİL'),
	(388, 27, 'YAVUZELİ'),
	(389, 28, 'ALUCRA'),
	(390, 28, 'BULANCAK'),
	(391, 28, 'ÇAMOLUK'),
	(392, 28, 'ÇANAKÇI'),
	(393, 28, 'DERELİ'),
	(394, 28, 'DOĞANKENT'),
	(395, 28, 'ESPİYE'),
	(396, 28, 'EYNESİL'),
	(397, 28, 'GÖRELE'),
	(398, 28, 'GÜCE'),
	(399, 28, 'KEŞAP'),
	(400, 28, 'MERKEZ'),
	(401, 28, 'PİRAZİZ'),
	(402, 28, 'ŞEBİNKARAHİSAR'),
	(403, 28, 'TİREBOLU'),
	(404, 28, 'YAĞLIDERE'),
	(405, 29, 'KELKİT'),
	(406, 29, 'KÖSE'),
	(407, 29, 'KÜRTÜN'),
	(408, 29, 'MERKEZ'),
	(409, 29, 'ŞİRAN'),
	(410, 29, 'TORUL'),
	(411, 30, 'ÇUKURCA'),
	(412, 30, 'DERECİK'),
	(413, 30, 'MERKEZ'),
	(414, 30, 'ŞEMDİNLİ'),
	(415, 30, 'YÜKSEKOVA'),
	(416, 31, 'ALTINÖZÜ'),
	(417, 31, 'ANTAKYA'),
	(418, 31, 'ARSUZ'),
	(419, 31, 'BELEN'),
	(420, 31, 'DEFNE'),
	(421, 31, 'DÖRTYOL'),
	(422, 31, 'ERZİN'),
	(423, 31, 'HASSA'),
	(424, 31, 'İSKENDERUN'),
	(425, 31, 'KIRIKHAN'),
	(426, 31, 'KUMLU'),
	(427, 31, 'PAYAS'),
	(428, 31, 'REYHANLI'),
	(429, 31, 'SAMANDAĞ'),
	(430, 31, 'YAYLADAĞI'),
	(431, 76, 'ARALIK'),
	(432, 76, 'KARAKOYUNLU'),
	(433, 76, 'MERKEZ'),
	(434, 76, 'TUZLUCA'),
	(435, 32, 'AKSU'),
	(436, 32, 'ATABEY'),
	(437, 32, 'EĞİRDİR'),
	(438, 32, 'GELENDOST'),
	(439, 32, 'GÖNEN'),
	(440, 32, 'KEÇİBORLU'),
	(441, 32, 'MERKEZ'),
	(442, 32, 'SENİRKENT'),
	(443, 32, 'SÜTÇÜLER'),
	(444, 32, 'ŞARKİKARAAĞAÇ'),
	(445, 32, 'ULUBORLU'),
	(446, 32, 'YALVAÇ'),
	(447, 32, 'YENİŞARBADEMLİ'),
	(448, 34, 'ADALAR'),
	(449, 34, 'ARNAVUTKÖY'),
	(450, 34, 'ATAŞEHİR'),
	(451, 34, 'AVCILAR'),
	(452, 34, 'BAĞCILAR'),
	(453, 34, 'BAHÇELİEVLER'),
	(454, 34, 'BAKIRKÖY'),
	(455, 34, 'BAŞAKŞEHİR'),
	(456, 34, 'BAYRAMPAŞA'),
	(457, 34, 'BEŞİKTAŞ'),
	(458, 34, 'BEYKOZ'),
	(459, 34, 'BEYLİKDÜZÜ'),
	(460, 34, 'BEYOĞLU'),
	(461, 34, 'BÜYÜKÇEKMECE'),
	(462, 34, 'ÇATALCA'),
	(463, 34, 'ÇEKMEKÖY'),
	(464, 34, 'ESENLER'),
	(465, 34, 'ESENYURT'),
	(466, 34, 'EYÜPSULTAN'),
	(467, 34, 'FATİH'),
	(468, 34, 'GAZİOSMANPAŞA'),
	(469, 34, 'GÜNGÖREN'),
	(470, 34, 'KADIKÖY'),
	(471, 34, 'KAĞITHANE'),
	(472, 34, 'KARTAL'),
	(473, 34, 'KÜÇÜKÇEKMECE'),
	(474, 34, 'MALTEPE'),
	(475, 34, 'PENDİK'),
	(476, 34, 'SANCAKTEPE'),
	(477, 34, 'SARIYER'),
	(478, 34, 'SİLİVRİ'),
	(479, 34, 'SULTANBEYLİ'),
	(480, 34, 'SULTANGAZİ'),
	(481, 34, 'ŞİLE'),
	(482, 34, 'ŞİŞLİ'),
	(483, 34, 'TUZLA'),
	(484, 34, 'ÜMRANİYE'),
	(485, 34, 'ÜSKÜDAR'),
	(486, 34, 'ZEYTİNBURNU'),
	(487, 35, 'ALİAĞA'),
	(488, 35, 'BALÇOVA'),
	(489, 35, 'BAYINDIR'),
	(490, 35, 'BAYRAKLI'),
	(491, 35, 'BERGAMA'),
	(492, 35, 'BEYDAĞ'),
	(493, 35, 'BORNOVA'),
	(494, 35, 'BUCA'),
	(495, 35, 'ÇEŞME'),
	(496, 35, 'ÇİĞLİ'),
	(497, 35, 'DİKİLİ'),
	(498, 35, 'FOÇA'),
	(499, 35, 'GAZİEMİR');
INSERT INTO public."Counties" VALUES
	(500, 35, 'GÜZELBAHÇE'),
	(501, 35, 'KARABAĞLAR'),
	(502, 35, 'KARABURUN'),
	(503, 35, 'KARŞIYAKA'),
	(504, 35, 'KEMALPAŞA'),
	(505, 35, 'KINIK'),
	(506, 35, 'KİRAZ'),
	(507, 35, 'KONAK'),
	(508, 35, 'MENDERES'),
	(509, 35, 'MENEMEN'),
	(510, 35, 'NARLIDERE'),
	(511, 35, 'ÖDEMİŞ'),
	(512, 35, 'SEFERİHİSAR'),
	(513, 35, 'SELÇUK'),
	(514, 35, 'TİRE'),
	(515, 35, 'TORBALI'),
	(516, 35, 'URLA'),
	(517, 46, 'AFŞİN'),
	(518, 46, 'ANDIRIN'),
	(519, 46, 'ÇAĞLAYANCERİT'),
	(520, 46, 'DULKADİROĞLU'),
	(521, 46, 'EKİNÖZÜ'),
	(522, 46, 'ELBİSTAN'),
	(523, 46, 'GÖKSUN'),
	(524, 46, 'NURHAK'),
	(525, 46, 'ONİKİŞUBAT'),
	(526, 46, 'PAZARCIK'),
	(527, 46, 'TÜRKOĞLU'),
	(528, 78, 'EFLANİ'),
	(529, 78, 'ESKİPAZAR'),
	(530, 78, 'MERKEZ'),
	(531, 78, 'OVACIK'),
	(532, 78, 'SAFRANBOLU'),
	(533, 78, 'YENİCE'),
	(534, 70, 'AYRANCI'),
	(535, 70, 'BAŞYAYLA'),
	(536, 70, 'ERMENEK'),
	(537, 70, 'KAZIMKARABEKİR'),
	(538, 70, 'MERKEZ'),
	(539, 70, 'SARIVELİLER'),
	(540, 36, 'AKYAKA'),
	(541, 36, 'ARPAÇAY'),
	(542, 36, 'DİGOR'),
	(543, 36, 'KAĞIZMAN'),
	(544, 36, 'MERKEZ'),
	(545, 36, 'SARIKAMIŞ'),
	(546, 36, 'SELİM'),
	(547, 36, 'SUSUZ'),
	(548, 37, 'ABANA'),
	(549, 37, 'AĞLI'),
	(550, 37, 'ARAÇ'),
	(551, 37, 'AZDAVAY'),
	(552, 37, 'BOZKURT'),
	(553, 37, 'CİDE'),
	(554, 37, 'ÇATALZEYTİN'),
	(555, 37, 'DADAY'),
	(556, 37, 'DEVREKANİ'),
	(557, 37, 'DOĞANYURT'),
	(558, 37, 'HANÖNÜ'),
	(559, 37, 'İHSANGAZİ'),
	(560, 37, 'İNEBOLU'),
	(561, 37, 'KÜRE'),
	(562, 37, 'MERKEZ'),
	(563, 37, 'PINARBAŞI'),
	(564, 37, 'SEYDİLER'),
	(565, 37, 'ŞENPAZAR'),
	(566, 37, 'TAŞKÖPRÜ'),
	(567, 37, 'TOSYA'),
	(568, 38, 'AKKIŞLA'),
	(569, 38, 'BÜNYAN'),
	(570, 38, 'DEVELİ'),
	(571, 38, 'FELAHİYE'),
	(572, 38, 'HACILAR'),
	(573, 38, 'İNCESU'),
	(574, 38, 'KOCASİNAN'),
	(575, 38, 'MELİKGAZİ'),
	(576, 38, 'ÖZVATAN'),
	(577, 38, 'PINARBAŞI'),
	(578, 38, 'SARIOĞLAN'),
	(579, 38, 'SARIZ'),
	(580, 38, 'TALAS'),
	(581, 38, 'TOMARZA'),
	(582, 38, 'YAHYALI'),
	(583, 38, 'YEŞİLHİSAR'),
	(584, 71, 'BAHŞILI'),
	(585, 71, 'BALIŞEYH'),
	(586, 71, 'ÇELEBİ'),
	(587, 71, 'DELİCE'),
	(588, 71, 'KARAKEÇİLİ'),
	(589, 71, 'KESKİN'),
	(590, 71, 'MERKEZ'),
	(591, 71, 'SULAKYURT'),
	(592, 71, 'YAHŞİHAN'),
	(593, 39, 'BABAESKİ'),
	(594, 39, 'DEMİRKÖY'),
	(595, 39, 'KOFÇAZ'),
	(596, 39, 'LÜLEBURGAZ'),
	(597, 39, 'MERKEZ'),
	(598, 39, 'PEHLİVANKÖY'),
	(599, 39, 'PINARHİSAR'),
	(600, 39, 'VİZE'),
	(601, 40, 'AKÇAKENT'),
	(602, 40, 'AKPINAR'),
	(603, 40, 'BOZTEPE'),
	(604, 40, 'ÇİÇEKDAĞI'),
	(605, 40, 'KAMAN'),
	(606, 40, 'MERKEZ'),
	(607, 40, 'MUCUR'),
	(608, 79, 'ELBEYLİ'),
	(609, 79, 'MERKEZ'),
	(610, 79, 'MUSABEYLİ'),
	(611, 79, 'POLATELİ'),
	(612, 41, 'BAŞİSKELE'),
	(613, 41, 'ÇAYIROVA'),
	(614, 41, 'DARICA'),
	(615, 41, 'DERİNCE'),
	(616, 41, 'DİLOVASI'),
	(617, 41, 'GEBZE'),
	(618, 41, 'GÖLCÜK'),
	(619, 41, 'İZMİT'),
	(620, 41, 'KANDIRA'),
	(621, 41, 'KARAMÜRSEL'),
	(622, 41, 'KARTEPE'),
	(623, 41, 'KÖRFEZ'),
	(624, 42, 'AHIRLI'),
	(625, 42, 'AKÖREN'),
	(626, 42, 'AKŞEHİR'),
	(627, 42, 'ALTINEKİN'),
	(628, 42, 'BEYŞEHİR'),
	(629, 42, 'BOZKIR'),
	(630, 42, 'CİHANBEYLİ'),
	(631, 42, 'ÇELTİK'),
	(632, 42, 'ÇUMRA'),
	(633, 42, 'DERBENT'),
	(634, 42, 'DEREBUCAK'),
	(635, 42, 'DOĞANHİSAR'),
	(636, 42, 'EMİRGAZİ'),
	(637, 42, 'EREĞLİ'),
	(638, 42, 'GÜNEYSINIR'),
	(639, 42, 'HADİM'),
	(640, 42, 'HALKAPINAR'),
	(641, 42, 'HÜYÜK'),
	(642, 42, 'ILGIN'),
	(643, 42, 'KADINHANI'),
	(644, 42, 'KARAPINAR'),
	(645, 42, 'KARATAY'),
	(646, 42, 'KULU'),
	(647, 42, 'MERAM'),
	(648, 42, 'SARAYÖNÜ'),
	(649, 42, 'SELÇUKLU'),
	(650, 42, 'SEYDİŞEHİR'),
	(651, 42, 'TAŞKENT'),
	(652, 42, 'TUZLUKÇU'),
	(653, 42, 'YALIHÜYÜK'),
	(654, 42, 'YUNAK'),
	(655, 43, 'ALTINTAŞ'),
	(656, 43, 'ASLANAPA'),
	(657, 43, 'ÇAVDARHİSAR'),
	(658, 43, 'DOMANİÇ'),
	(659, 43, 'DUMLUPINAR'),
	(660, 43, 'EMET'),
	(661, 43, 'GEDİZ'),
	(662, 43, 'HİSARCIK'),
	(663, 43, 'MERKEZ'),
	(664, 43, 'PAZARLAR'),
	(665, 43, 'SİMAV'),
	(666, 43, 'ŞAPHANE'),
	(667, 43, 'TAVŞANLI'),
	(668, 44, 'AKÇADAĞ'),
	(669, 44, 'ARAPGİR'),
	(670, 44, 'ARGUVAN'),
	(671, 44, 'BATTALGAZİ'),
	(672, 44, 'DARENDE'),
	(673, 44, 'DOĞANŞEHİR'),
	(674, 44, 'DOĞANYOL'),
	(675, 44, 'HEKİMHAN'),
	(676, 44, 'KALE'),
	(677, 44, 'KULUNCAK'),
	(678, 44, 'PÜTÜRGE'),
	(679, 44, 'YAZIHAN'),
	(680, 44, 'YEŞİLYURT'),
	(681, 45, 'AHMETLİ'),
	(682, 45, 'AKHİSAR'),
	(683, 45, 'ALAŞEHİR'),
	(684, 45, 'DEMİRCİ'),
	(685, 45, 'GÖLMARMARA'),
	(686, 45, 'GÖRDES'),
	(687, 45, 'KIRKAĞAÇ'),
	(688, 45, 'KÖPRÜBAŞI'),
	(689, 45, 'KULA'),
	(690, 45, 'SALİHLİ'),
	(691, 45, 'SARIGÖL'),
	(692, 45, 'SARUHANLI'),
	(693, 45, 'SELENDİ'),
	(694, 45, 'SOMA'),
	(695, 45, 'ŞEHZADELER'),
	(696, 45, 'TURGUTLU'),
	(697, 45, 'YUNUSEMRE'),
	(698, 47, 'ARTUKLU'),
	(699, 47, 'DARGEÇİT'),
	(700, 47, 'DERİK'),
	(701, 47, 'KIZILTEPE'),
	(702, 47, 'MAZIDAĞI'),
	(703, 47, 'MİDYAT'),
	(704, 47, 'NUSAYBİN'),
	(705, 47, 'ÖMERLİ'),
	(706, 47, 'SAVUR'),
	(707, 47, 'YEŞİLLİ'),
	(708, 33, 'AKDENİZ'),
	(709, 33, 'ANAMUR'),
	(710, 33, 'AYDINCIK'),
	(711, 33, 'BOZYAZI'),
	(712, 33, 'ÇAMLIYAYLA'),
	(713, 33, 'ERDEMLİ'),
	(714, 33, 'GÜLNAR'),
	(715, 33, 'MEZİTLİ'),
	(716, 33, 'MUT'),
	(717, 33, 'SİLİFKE'),
	(718, 33, 'TARSUS'),
	(719, 33, 'TOROSLAR'),
	(720, 33, 'YENİŞEHİR'),
	(721, 48, 'BODRUM'),
	(722, 48, 'DALAMAN'),
	(723, 48, 'DATÇA'),
	(724, 48, 'FETHİYE'),
	(725, 48, 'KAVAKLIDERE'),
	(726, 48, 'KÖYCEĞİZ'),
	(727, 48, 'MARMARİS'),
	(728, 48, 'MENTEŞE'),
	(729, 48, 'MİLAS'),
	(730, 48, 'ORTACA'),
	(731, 48, 'SEYDİKEMER'),
	(732, 48, 'ULA'),
	(733, 48, 'YATAĞAN'),
	(734, 49, 'BULANIK'),
	(735, 49, 'HASKÖY'),
	(736, 49, 'KORKUT'),
	(737, 49, 'MALAZGİRT'),
	(738, 49, 'MERKEZ'),
	(739, 49, 'VARTO'),
	(740, 50, 'ACIGÖL'),
	(741, 50, 'AVANOS'),
	(742, 50, 'DERİNKUYU'),
	(743, 50, 'GÜLŞEHİR'),
	(744, 50, 'HACIBEKTAŞ'),
	(745, 50, 'KOZAKLI'),
	(746, 50, 'MERKEZ'),
	(747, 50, 'ÜRGÜP'),
	(748, 51, 'ALTUNHİSAR'),
	(749, 51, 'BOR');
INSERT INTO public."Counties" VALUES
	(750, 51, 'ÇAMARDI'),
	(751, 51, 'ÇİFTLİK'),
	(752, 51, 'MERKEZ'),
	(753, 51, 'ULUKIŞLA'),
	(754, 52, 'AKKUŞ'),
	(755, 52, 'ALTINORDU'),
	(756, 52, 'AYBASTI'),
	(757, 52, 'ÇAMAŞ'),
	(758, 52, 'ÇATALPINAR'),
	(759, 52, 'ÇAYBAŞI'),
	(760, 52, 'FATSA'),
	(761, 52, 'GÖLKÖY'),
	(762, 52, 'GÜLYALI'),
	(763, 52, 'GÜRGENTEPE'),
	(764, 52, 'İKİZCE'),
	(765, 52, 'KABADÜZ'),
	(766, 52, 'KABATAŞ'),
	(767, 52, 'KORGAN'),
	(768, 52, 'KUMRU'),
	(769, 52, 'MESUDİYE'),
	(770, 52, 'PERŞEMBE'),
	(771, 52, 'ULUBEY'),
	(772, 52, 'ÜNYE'),
	(773, 80, 'BAHÇE'),
	(774, 80, 'DÜZİÇİ'),
	(775, 80, 'HASANBEYLİ'),
	(776, 80, 'KADİRLİ'),
	(777, 80, 'MERKEZ'),
	(778, 80, 'SUMBAS'),
	(779, 80, 'TOPRAKKALE'),
	(780, 53, 'ARDEŞEN'),
	(781, 53, 'ÇAMLIHEMŞİN'),
	(782, 53, 'ÇAYELİ'),
	(783, 53, 'DEREPAZARI'),
	(784, 53, 'FINDIKLI'),
	(785, 53, 'GÜNEYSU'),
	(786, 53, 'HEMŞİN'),
	(787, 53, 'İKİZDERE'),
	(788, 53, 'İYİDERE'),
	(789, 53, 'KALKANDERE'),
	(790, 53, 'MERKEZ'),
	(791, 53, 'PAZAR'),
	(792, 54, 'ADAPAZARI'),
	(793, 54, 'AKYAZI'),
	(794, 54, 'ARİFİYE'),
	(795, 54, 'ERENLER'),
	(796, 54, 'FERİZLİ'),
	(797, 54, 'GEYVE'),
	(798, 54, 'HENDEK'),
	(799, 54, 'KARAPÜRÇEK'),
	(800, 54, 'KARASU'),
	(801, 54, 'KAYNARCA'),
	(802, 54, 'KOCAALİ'),
	(803, 54, 'PAMUKOVA'),
	(804, 54, 'SAPANCA'),
	(805, 54, 'SERDİVAN'),
	(806, 54, 'SÖĞÜTLÜ'),
	(807, 54, 'TARAKLI'),
	(808, 55, '19 MAYIS'),
	(809, 55, 'ALAÇAM'),
	(810, 55, 'ASARCIK'),
	(811, 55, 'ATAKUM'),
	(812, 55, 'AYVACIK'),
	(813, 55, 'BAFRA'),
	(814, 55, 'CANİK'),
	(815, 55, 'ÇARŞAMBA'),
	(816, 55, 'HAVZA'),
	(817, 55, 'İLKADIM'),
	(818, 55, 'KAVAK'),
	(819, 55, 'LADİK'),
	(820, 55, 'SALIPAZARI'),
	(821, 55, 'TEKKEKÖY'),
	(822, 55, 'TERME'),
	(823, 55, 'VEZİRKÖPRÜ'),
	(824, 55, 'YAKAKENT'),
	(825, 56, 'BAYKAN'),
	(826, 56, 'ERUH'),
	(827, 56, 'KURTALAN'),
	(828, 56, 'MERKEZ'),
	(829, 56, 'PERVARİ'),
	(830, 56, 'ŞİRVAN'),
	(831, 56, 'TİLLO'),
	(832, 57, 'AYANCIK'),
	(833, 57, 'BOYABAT'),
	(834, 57, 'DİKMEN'),
	(835, 57, 'DURAĞAN'),
	(836, 57, 'ERFELEK'),
	(837, 57, 'GERZE'),
	(838, 57, 'MERKEZ'),
	(839, 57, 'SARAYDÜZÜ'),
	(840, 57, 'TÜRKELİ'),
	(841, 58, 'AKINCILAR'),
	(842, 58, 'ALTINYAYLA'),
	(843, 58, 'DİVRİĞİ'),
	(844, 58, 'DOĞANŞAR'),
	(845, 58, 'GEMEREK'),
	(846, 58, 'GÖLOVA'),
	(847, 58, 'GÜRÜN'),
	(848, 58, 'HAFİK'),
	(849, 58, 'İMRANLI'),
	(850, 58, 'KANGAL'),
	(851, 58, 'KOYULHİSAR'),
	(852, 58, 'MERKEZ'),
	(853, 58, 'SUŞEHRİ'),
	(854, 58, 'ŞARKIŞLA'),
	(855, 58, 'ULAŞ'),
	(856, 58, 'YILDIZELİ'),
	(857, 58, 'ZARA'),
	(858, 63, 'AKÇAKALE'),
	(859, 63, 'BİRECİK'),
	(860, 63, 'BOZOVA'),
	(861, 63, 'CEYLANPINAR'),
	(862, 63, 'EYYÜBİYE'),
	(863, 63, 'HALFETİ'),
	(864, 63, 'HALİLİYE'),
	(865, 63, 'HARRAN'),
	(866, 63, 'HİLVAN'),
	(867, 63, 'KARAKÖPRÜ'),
	(868, 63, 'SİVEREK'),
	(869, 63, 'SURUÇ'),
	(870, 63, 'VİRANŞEHİR'),
	(871, 73, 'BEYTÜŞŞEBAP'),
	(872, 73, 'CİZRE'),
	(873, 73, 'GÜÇLÜKONAK'),
	(874, 73, 'İDİL'),
	(875, 73, 'MERKEZ'),
	(876, 73, 'SİLOPİ'),
	(877, 73, 'ULUDERE'),
	(878, 59, 'ÇERKEZKÖY'),
	(879, 59, 'ÇORLU'),
	(880, 59, 'ERGENE'),
	(881, 59, 'HAYRABOLU'),
	(882, 59, 'KAPAKLI'),
	(883, 59, 'MALKARA'),
	(884, 59, 'MARMARAEREĞLİSİ'),
	(885, 59, 'MURATLI'),
	(886, 59, 'SARAY'),
	(887, 59, 'SÜLEYMANPAŞA'),
	(888, 59, 'ŞARKÖY'),
	(889, 60, 'ALMUS'),
	(890, 60, 'ARTOVA'),
	(891, 60, 'BAŞÇİFTLİK'),
	(892, 60, 'ERBAA'),
	(893, 60, 'MERKEZ'),
	(894, 60, 'NİKSAR'),
	(895, 60, 'PAZAR'),
	(896, 60, 'REŞADİYE'),
	(897, 60, 'SULUSARAY'),
	(898, 60, 'TURHAL'),
	(899, 60, 'YEŞİLYURT'),
	(900, 60, 'ZİLE'),
	(901, 61, 'AKÇAABAT'),
	(902, 61, 'ARAKLI'),
	(903, 61, 'ARSİN'),
	(904, 61, 'BEŞİKDÜZÜ'),
	(905, 61, 'ÇARŞIBAŞI'),
	(906, 61, 'ÇAYKARA'),
	(907, 61, 'DERNEKPAZARI'),
	(908, 61, 'DÜZKÖY'),
	(909, 61, 'HAYRAT'),
	(910, 61, 'KÖPRÜBAŞI'),
	(911, 61, 'MAÇKA'),
	(912, 61, 'OF'),
	(913, 61, 'ORTAHİSAR'),
	(914, 61, 'SÜRMENE'),
	(915, 61, 'ŞALPAZARI'),
	(916, 61, 'TONYA'),
	(917, 61, 'VAKFIKEBİR'),
	(918, 61, 'YOMRA'),
	(919, 62, 'HOZAT'),
	(920, 62, 'MAZGİRT'),
	(921, 62, 'MERKEZ'),
	(922, 62, 'NAZIMİYE'),
	(923, 62, 'OVACIK'),
	(924, 62, 'PERTEK'),
	(925, 62, 'PÜLÜMÜR'),
	(926, 64, 'BANAZ'),
	(927, 64, 'EŞME'),
	(928, 64, 'KARAHALLI'),
	(929, 64, 'MERKEZ'),
	(930, 64, 'SİVASLI'),
	(931, 64, 'ULUBEY'),
	(932, 65, 'BAHÇESARAY'),
	(933, 65, 'BAŞKALE'),
	(934, 65, 'ÇALDIRAN'),
	(935, 65, 'ÇATAK'),
	(936, 65, 'EDREMİT'),
	(937, 65, 'ERCİŞ'),
	(938, 65, 'GEVAŞ'),
	(939, 65, 'GÜRPINAR'),
	(940, 65, 'İPEKYOLU'),
	(941, 65, 'MURADİYE'),
	(942, 65, 'ÖZALP'),
	(943, 65, 'SARAY'),
	(944, 65, 'TUŞBA'),
	(945, 77, 'ALTINOVA'),
	(946, 77, 'ARMUTLU'),
	(947, 77, 'ÇINARCIK'),
	(948, 77, 'ÇİFTLİKKÖY'),
	(949, 77, 'MERKEZ'),
	(950, 77, 'TERMAL'),
	(951, 66, 'AKDAĞMADENİ'),
	(952, 66, 'AYDINCIK'),
	(953, 66, 'BOĞAZLIYAN'),
	(954, 66, 'ÇANDIR'),
	(955, 66, 'ÇAYIRALAN'),
	(956, 66, 'ÇEKEREK'),
	(957, 66, 'KADIŞEHRİ'),
	(958, 66, 'MERKEZ'),
	(959, 66, 'SARAYKENT'),
	(960, 66, 'SARIKAYA'),
	(961, 66, 'SORGUN'),
	(962, 66, 'ŞEFAATLİ'),
	(963, 66, 'YENİFAKILI'),
	(964, 66, 'YERKÖY'),
	(965, 67, 'ALAPLI'),
	(966, 67, 'ÇAYCUMA'),
	(967, 67, 'DEVREK'),
	(968, 67, 'EREĞLİ'),
	(969, 67, 'GÖKÇEBEY'),
	(970, 67, 'KİLİMLİ'),
	(971, 67, 'KOZLU'),
	(972, 67, 'MERKEZ');


--
-- Data for Name: Departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Departments" VALUES
	(0, 'Seçiniz'),
	(1, 'MEDYA VE İLETIŞIM'),
	(2, 'FINANS'),
	(3, 'HUKUK'),
	(4, 'OPERASYON'),
	(5, 'İLETIŞIM'),
	(6, 'PAZARLAMA'),
	(7, 'YAZıLıM');


--
-- Data for Name: Directors; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Directors" VALUES
	(0, '-Seçiniz', '-'),
	(1, 'ÖMER FARUK', 'SORAK'),
	(2, 'ALI TANER', 'BALTACı'),
	(3, 'ATıL', 'İNANÇ'),
	(4, 'MEHMET ADA', 'ÖZTEKIN'),
	(5, 'YıLMAZ', 'ERDOĞAN'),
	(6, 'ÇAĞAN', 'IRMAK'),
	(7, 'SERDAR', 'AKAR');


--
-- Data for Name: Employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Employees" VALUES
	(0, '-Seçiniz', '-', '12345678900', 'adsoyad@gmail.com', 0, 0, 0),
	(1, 'EMRE', 'AKıNCı', '5321418881', 'yunus.akinci1@ogr.sakarya.edu.tr', 7, 54, 805),
	(2, 'ALI', 'ŞAFAK', '5392544131', 'alisafak@gmail.com', 1, 34, 455),
	(3, 'ARDA', 'TURAN', '5369480034', 'ardaturan@gmail.com', 4, 34, 456),
	(4, 'ALI', 'KOÇ', '5456128982', 'alikoc@gmail.com', 2, 34, 468),
	(5, 'HAKAN', 'ADALETOĞLU', '5439870126', 'adaletogluhakan@gmail.com', 3, 6, 90),
	(6, 'AYŞE', 'ACAR', '5331224454', 'ayseacar@gmail.com', 5, 34, 465),
	(7, 'FATMA', 'BAKıRCıOĞLU', '5331224454', 'fatmabakircioglu@gmail.com', 6, 34, 470);


--
-- Data for Name: Managers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Managers" VALUES
	(0, '-Seçiniz', '-'),
	(1, 'MUHARREM', 'AYGÜN'),
	(2, 'RASIM OZAN', 'KÜTAHYALı'),
	(3, 'SINAN', 'ENGIN'),
	(4, 'ERTEM', 'ŞENER'),
	(5, 'ABDULKERIM', 'DURMAZ'),
	(6, 'ACUN', 'KAPLıCALı'),
	(7, 'ESAT', 'YONTUNÇ'),
	(8, 'ALI RıZA SERGEN', 'YALÇıN');


--
-- Data for Name: MovieActors; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."MovieActors" VALUES
	(1, 'Arif Işık', 1, 1),
	(2, 'Bob Marley Faruk', 1, 2),
	(3, 'Garavel Usta', 1, 3),
	(4, 'Robot 216', 1, 4),
	(5, 'Kuna', 1, 6),
	(6, 'Ceku', 1, 9),
	(7, 'Rendroy', 1, 19),
	(8, 'Arif Işık', 2, 1),
	(9, 'Dimi', 2, 3),
	(10, 'Taso', 2, 4),
	(11, 'Ceku', 2, 9),
	(12, 'Mimi', 2, 10),
	(13, 'Özgür', 3, 6),
	(14, 'Sabri Abi', 3, 12),
	(15, 'Galerici Şahin', 3, 13),
	(16, 'Memo', 4, 14),
	(17, 'Askorozlu', 4, 16),
	(18, 'Müdür Nail', 4, 15),
	(19, 'Asım Noyan', 5, 5),
	(20, 'Müslüm Duralmaz', 5, 1),
	(21, 'Süpermen Samet', 5, 17),
	(22, 'Umut Ocak', 5, 18),
	(23, 'Üzeyir Kavak', 5, 19),
	(24, 'Silvio', 5, 20),
	(25, 'İlyas Bazna', 7, 7),
	(26, 'Cornelia Kapp', 7, 11);


--
-- Data for Name: MovieTypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."MovieTypes" VALUES
	(1, 1, 2),
	(2, 1, 5),
	(3, 2, 2),
	(4, 2, 5),
	(5, 3, 1),
	(6, 4, 1),
	(7, 5, 2),
	(8, 5, 3),
	(9, 6, 1),
	(10, 7, 4);


--
-- Data for Name: Movies; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Movies" VALUES
	(1, 'G.O.R.A', '2004-11-12', 1, 3),
	(2, 'A.R.O.G', '2008-12-05', 2, 3),
	(3, 'KOLPAÇINO', '2009-10-29', 3, 3),
	(4, '7. KOĞUŞTAKI MUCIZE', '2019-10-11', 4, 3),
	(5, 'ORGANIZE İŞLER', '2005-11-30', 5, 3),
	(6, 'BABAM VE OĞLUM', '2005-11-18', 6, 3),
	(7, 'ÇIÇERO', '2019-01-18', 7, 3);


--
-- Data for Name: OldEmployees; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: OldPlanPrices; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: Plans; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Plans" VALUES
	(0, '-Plan-', 0, '-Kalite-'),
	(1, 'BASIC', 27, 'HD'),
	(2, 'STANDARD', 40, 'Full HD'),
	(3, 'PREMIUM', 55, 'Ultra Hd'),
	(4, 'DENEME', 30, 'HD');


--
-- Data for Name: Subscribers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Subscribers" VALUES
	(1, 'Mesut', 'Özil', '5456706767', 'm10@gmail.com', 3, 67, 967),
	(2, 'Burçin', 'Çolakoğlu', '5331345464', 'burcincolakogluk@gmail.com', 1, 34, 450),
	(3, 'Burak', 'Dere', '5367642202', 'burakdere@gmail.com', 2, 54, 805),
	(4, 'Mete', 'Tan', '5364455406', 'metetan@gmail.com', 2, 54, 805),
	(5, 'Enes', 'Akıncı', '5369431122', 'enesakinci@gmail.com', 2, 54, 805),
	(6, 'Serdar', 'Dursun', '5431233434', 'dursunserdar@gmail.com', 1, 34, 470),
	(7, 'Beytullah', 'Yayla', '5322075454', 'beytullahyayla@gmail.com', 2, 54, 805),
	(8, 'Kutay', 'Dalgıç', '5356175406', 'dalgickutay@gmail.com', 2, 6, 72),
	(9, 'Emirhan', 'Usta', '5451235455', 'emirhanusta@gmail.com', 2, 55, 815),
	(10, 'Sercan', 'Özer', '53674354', 'sercanozer@gmail.com', 2, 47, 703),
	(11, 'Mustafa', 'Ünlü', '5340345434', 'unlumustafa@gmail.com', 2, 34, 455),
	(12, 'Mehmet', 'Arı', '5342155434', 'mehmetari@gmail.com', 2, 34, 455),
	(13, 'Yusuf', 'Yesin', '5436115434', 'dalgickutay@gmail.com', 2, 34, 459),
	(14, 'Melih', 'Özmen', '53312354', 'dalgickutay@gmail.com', 2, 60, 894),
	(15, 'Yiğit Alp', 'Alan', '5312433454', 'ygtalan@gmail.com', 1, 54, 792),
	(16, 'Kerem Bilal', 'Yazıcı', '5326145454', 'krmbllyzc@gmail.com', 1, 54, 792),
	(17, 'Mehmet Can', 'Çilingir', '5310543154', 'mhmtcnclngr@gmail.com', 1, 54, 792),
	(18, 'Enes', 'Fidan', '5364435416', 'enesfidan@gmail.com', 3, 54, 805),
	(19, 'Eray', 'Turan', '5312315454', 'eright@gmail.com', 1, 54, 805),
	(20, 'Furkan', 'Kara', '5436745454', 'dark.furkan@gmail.com', 2, 54, 805),
	(21, 'Emirhan', 'Çok', '5326311654', 'emirhancok54@gmail.com', 3, 54, 805),
	(22, 'Ömer', 'Bayrak', '5416414154', 'omerbayraktc@gmail.com', 3, 41, 619),
	(23, 'Berke', 'Özer', '5343413434', 'ozerberke@gmail.com', 4, 34, 470),
	(24, 'Ferdi', 'Kadıoğlu', '5367670034', 'ferdikadioglu@gmail.com', 4, 34, 470),
	(25, 'Caner', 'Erkin', '5436126134', 'canererkin88@gmail.com', 4, 34, 470);


--
-- Data for Name: Types; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Types" VALUES
	(1, 'DRAM'),
	(2, 'KOMEDI'),
	(3, 'AKSIYON'),
	(4, 'KURMACA'),
	(5, 'BILIMKURGU');


--
-- Name: Actors_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Actors_Id_seq"', 20, true);


--
-- Name: Cities_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Cities_Id_seq"', 81, true);


--
-- Name: Counties_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Counties_Id_seq"', 972, true);


--
-- Name: Departments_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Departments_Id_seq"', 7, true);


--
-- Name: Directors_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Directors_Id_seq"', 7, true);


--
-- Name: Employees_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Employees_Id_seq"', 7, true);


--
-- Name: Managers_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Managers_Id_seq"', 8, true);


--
-- Name: MovieActors_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."MovieActors_Id_seq"', 26, true);


--
-- Name: MovieTypes_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."MovieTypes_Id_seq"', 10, true);


--
-- Name: Movies_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Movies_Id_seq"', 7, true);


--
-- Name: OldEmployees_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."OldEmployees_Id_seq"', 1, false);


--
-- Name: OldPlanPrices_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."OldPlanPrices_Id_seq"', 1, false);


--
-- Name: Plans_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Plans_Id_seq"', 4, true);


--
-- Name: Subscribers_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Subscribers_Id_seq"', 25, true);


--
-- Name: Types_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Types_Id_seq"', 5, true);


--
-- Name: Cities Cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cities"
    ADD CONSTRAINT "Cities_pkey" PRIMARY KEY ("Id");


--
-- Name: Counties Counties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Counties"
    ADD CONSTRAINT "Counties_pkey" PRIMARY KEY ("Id");


--
-- Name: Departments Departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Departments"
    ADD CONSTRAINT "Departments_pkey" PRIMARY KEY ("Id");


--
-- Name: Actors actorPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Actors"
    ADD CONSTRAINT "actorPK" PRIMARY KEY ("Id");


--
-- Name: Directors directorPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Directors"
    ADD CONSTRAINT "directorPK" PRIMARY KEY ("Id");


--
-- Name: Employees employeePK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Employees"
    ADD CONSTRAINT "employeePK" PRIMARY KEY ("Id");


--
-- Name: Managers managerPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Managers"
    ADD CONSTRAINT "managerPK" PRIMARY KEY ("Id");


--
-- Name: MovieActors movieActorsPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MovieActors"
    ADD CONSTRAINT "movieActorsPK" PRIMARY KEY ("Id");


--
-- Name: Movies moviePK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Movies"
    ADD CONSTRAINT "moviePK" PRIMARY KEY ("Id");


--
-- Name: MovieTypes movieTypesPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MovieTypes"
    ADD CONSTRAINT "movieTypesPK" PRIMARY KEY ("Id");


--
-- Name: OldEmployees oldEmployeePK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OldEmployees"
    ADD CONSTRAINT "oldEmployeePK" PRIMARY KEY ("Id");


--
-- Name: OldPlanPrices oldPlanPricePK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OldPlanPrices"
    ADD CONSTRAINT "oldPlanPricePK" PRIMARY KEY ("Id");


--
-- Name: Plans planPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Plans"
    ADD CONSTRAINT "planPK" PRIMARY KEY ("Id");


--
-- Name: Subscribers subPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Subscribers"
    ADD CONSTRAINT "subPK" PRIMARY KEY ("Id");


--
-- Name: Types typePK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Types"
    ADD CONSTRAINT "typePK" PRIMARY KEY ("Id");


--
-- Name: Actors ActorCheck; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "ActorCheck" BEFORE INSERT OR UPDATE ON public."Actors" FOR EACH ROW EXECUTE FUNCTION public."ActorAdd"();


--
-- Name: Departments DepartmentCheck; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "DepartmentCheck" BEFORE INSERT OR UPDATE ON public."Departments" FOR EACH ROW EXECUTE FUNCTION public."DepartmentAdd"();


--
-- Name: Directors DirectorCheck; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "DirectorCheck" BEFORE INSERT OR UPDATE ON public."Directors" FOR EACH ROW EXECUTE FUNCTION public."DirectorAdd"();


--
-- Name: Employees EmployeeCheck; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "EmployeeCheck" BEFORE INSERT OR UPDATE ON public."Employees" FOR EACH ROW EXECUTE FUNCTION public."EmployeeAdd"();


--
-- Name: Managers ManagerCheck; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "ManagerCheck" BEFORE INSERT OR UPDATE ON public."Managers" FOR EACH ROW EXECUTE FUNCTION public."ManagerAdd"();


--
-- Name: Movies MovieCheck; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "MovieCheck" BEFORE INSERT OR UPDATE ON public."Movies" FOR EACH ROW EXECUTE FUNCTION public."MovieAdd"();


--
-- Name: Plans PlanCheck; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "PlanCheck" BEFORE INSERT OR UPDATE ON public."Plans" FOR EACH ROW EXECUTE FUNCTION public."PlanAdd"();


--
-- Name: Types TypeCheck; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "TypeCheck" BEFORE INSERT OR UPDATE ON public."Types" FOR EACH ROW EXECUTE FUNCTION public."TypeAdd"();


--
-- Name: Employees beforeemployeedelete; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER beforeemployeedelete BEFORE DELETE ON public."Employees" FOR EACH ROW EXECUTE FUNCTION public."employeeLeft"();


--
-- Name: Plans ifPlanPriceChange; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "ifPlanPriceChange" BEFORE UPDATE ON public."Plans" FOR EACH ROW EXECUTE FUNCTION public."planPriceChanged"();


--
-- Name: Actors Actors_ManagerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Actors"
    ADD CONSTRAINT "Actors_ManagerId_fkey" FOREIGN KEY ("ManagerId") REFERENCES public."Managers"("Id") ON UPDATE CASCADE ON DELETE SET DEFAULT;


--
-- Name: Counties Counties_CityId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Counties"
    ADD CONSTRAINT "Counties_CityId_fkey" FOREIGN KEY ("CityId") REFERENCES public."Cities"("Id");


--
-- Name: Employees Employees_CityId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Employees"
    ADD CONSTRAINT "Employees_CityId_fkey" FOREIGN KEY ("CityId") REFERENCES public."Cities"("Id");


--
-- Name: Employees Employees_CountyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Employees"
    ADD CONSTRAINT "Employees_CountyId_fkey" FOREIGN KEY ("CountyId") REFERENCES public."Counties"("Id");


--
-- Name: Employees Employees_DepartmentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Employees"
    ADD CONSTRAINT "Employees_DepartmentId_fkey" FOREIGN KEY ("DepartmentId") REFERENCES public."Departments"("Id") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: MovieActors MovieActors_ActorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MovieActors"
    ADD CONSTRAINT "MovieActors_ActorId_fkey" FOREIGN KEY ("ActorId") REFERENCES public."Actors"("Id") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: MovieActors MovieActors_MovieId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MovieActors"
    ADD CONSTRAINT "MovieActors_MovieId_fkey" FOREIGN KEY ("MovieId") REFERENCES public."Movies"("Id") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: MovieTypes MovieTypes_MovieId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MovieTypes"
    ADD CONSTRAINT "MovieTypes_MovieId_fkey" FOREIGN KEY ("MovieId") REFERENCES public."Movies"("Id") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: MovieTypes MovieTypes_TypeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MovieTypes"
    ADD CONSTRAINT "MovieTypes_TypeId_fkey" FOREIGN KEY ("TypeId") REFERENCES public."Types"("Id") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Movies Movies_DirectorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Movies"
    ADD CONSTRAINT "Movies_DirectorId_fkey" FOREIGN KEY ("DirectorId") REFERENCES public."Directors"("Id") ON UPDATE CASCADE ON DELETE SET DEFAULT;


--
-- Name: Movies Movies_EmployeeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Movies"
    ADD CONSTRAINT "Movies_EmployeeId_fkey" FOREIGN KEY ("EmployeeId") REFERENCES public."Employees"("Id") ON UPDATE CASCADE ON DELETE SET DEFAULT;


--
-- Name: OldEmployees OldEmployees_DepartmentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OldEmployees"
    ADD CONSTRAINT "OldEmployees_DepartmentId_fkey" FOREIGN KEY ("DepartmentId") REFERENCES public."Departments"("Id") ON UPDATE CASCADE ON DELETE SET DEFAULT;


--
-- Name: OldPlanPrices OldPlanPrices_PlanId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OldPlanPrices"
    ADD CONSTRAINT "OldPlanPrices_PlanId_fkey" FOREIGN KEY ("PlanId") REFERENCES public."Plans"("Id") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Subscribers Subscribers_CityId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Subscribers"
    ADD CONSTRAINT "Subscribers_CityId_fkey" FOREIGN KEY ("CityId") REFERENCES public."Cities"("Id");


--
-- Name: Subscribers Subscribers_CountyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Subscribers"
    ADD CONSTRAINT "Subscribers_CountyId_fkey" FOREIGN KEY ("CountyId") REFERENCES public."Counties"("Id");


--
-- Name: Subscribers Subscribers_PlanId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Subscribers"
    ADD CONSTRAINT "Subscribers_PlanId_fkey" FOREIGN KEY ("PlanId") REFERENCES public."Plans"("Id") ON UPDATE CASCADE ON DELETE SET DEFAULT;


--
-- PostgreSQL database dump complete
--

