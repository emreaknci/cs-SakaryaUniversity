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

CREATE FUNCTION public.getemployeebydepartmentid(departmentid integer) RETURNS TABLE(id integer, ad character varying, soyad character varying, telefon character varying, mail character varying, departmanno integer, "??ehirno" integer, "??l??eno" integer)
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

CREATE FUNCTION public.getoldemployeebydepartmentid(departmentid integer) RETURNS TABLE(id integer, ad character varying, soyad character varying, telefon character varying, mail character varying, departmanno integer, "ayr??lmatarihi" timestamp without time zone)
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
    "DepartmentId" integer DEFAULT 0 NOT NULL,
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
	(1, 'CEM', 'Y??LMAZ', 1),
	(2, 'RASIM', '??ZTEKIN', 8),
	(3, '??ZKAN', 'U??UR', 1),
	(4, 'OZAN', 'G??VEN', 1),
	(5, 'Y??LMAZ', 'ERDO??AN', 4),
	(6, '??AFAK', 'SEZER', 5),
	(7, 'ERDAL', 'BE??IKCIO??LU', 2),
	(8, 'ENGIN', 'G??NAYD??N', 6),
	(9, '??ZGE', '??ZBERK', 3),
	(10, 'NIL', 'KARAIBRAHIMGIL', 3),
	(11, 'BURCU', 'BIRICIK', 3),
	(12, 'AYDEMIR', 'AKBA??', 6),
	(13, 'SERKAN', '??ENG??L', 6),
	(14, 'ARAS BULUT', '??YNEMLI', 8),
	(15, 'SARP', 'AKKAYA', 8),
	(16, '??LKER', 'AKSUM', 7),
	(17, 'TOLGA', '??EVIK', 4),
	(18, '??ZG??', 'NAMAL', 4),
	(19, 'ERDAL', 'TOSUN', 5),
	(20, '??NER', 'ERKAN', 6);


--
-- Data for Name: Cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Cities" VALUES
	(0, 'Se??iniz'),
	(1, 'ADANA'),
	(2, 'ADIYAMAN'),
	(3, 'AFYON'),
	(4, 'A??RI'),
	(5, 'AMASYA'),
	(6, 'ANKARA'),
	(7, 'ANTALYA'),
	(8, 'ARTV??N'),
	(9, 'AYDIN'),
	(10, 'BALIKES??R'),
	(11, 'B??LEC??K'),
	(12, 'B??NG??L'),
	(13, 'B??TL??S'),
	(14, 'BOLU'),
	(15, 'BURDUR'),
	(16, 'BURSA'),
	(17, '??ANAKKALE'),
	(18, '??ANKIRI'),
	(19, '??ORUM'),
	(20, 'DEN??ZL??'),
	(21, 'D??YARBAKIR'),
	(22, 'ED??RNE'),
	(23, 'ELAZI??'),
	(24, 'ERZ??NCAN'),
	(25, 'ERZURUM'),
	(26, 'ESK????EH??R'),
	(27, 'GAZ??ANTEP'),
	(28, 'G??RESUN'),
	(29, 'G??M????HANE'),
	(30, 'HAKKAR??'),
	(31, 'HATAY'),
	(32, 'ISPARTA'),
	(33, '????EL'),
	(34, '??STANBUL'),
	(35, '??ZM??R'),
	(36, 'KARS'),
	(37, 'KASTAMONU'),
	(38, 'KAYSER??'),
	(39, 'KIRKLAREL??'),
	(40, 'KIR??EH??R'),
	(41, 'KOCAEL??'),
	(42, 'KONYA'),
	(43, 'K??TAHYA'),
	(44, 'MALATYA'),
	(45, 'MAN??SA'),
	(46, 'KAHRAMANMARA??'),
	(47, 'MARD??N'),
	(48, 'MU??LA'),
	(49, 'MU??'),
	(50, 'NEV??EH??R'),
	(51, 'N????DE'),
	(52, 'ORDU'),
	(53, 'R??ZE'),
	(54, 'SAKARYA'),
	(55, 'SAMSUN'),
	(56, 'S????RT'),
	(57, 'S??NOP'),
	(58, 'S??VAS'),
	(59, 'TEK??RDA??'),
	(60, 'TOKAT'),
	(61, 'TRABZON'),
	(62, 'TUNCEL??'),
	(63, '??ANLIURFA'),
	(64, 'U??AK'),
	(65, 'VAN'),
	(66, 'YOZGAT'),
	(67, 'ZONGULDAK'),
	(68, 'AKSARAY'),
	(69, 'BAYBURT'),
	(70, 'KARAMAN'),
	(71, 'KIRIKKALE'),
	(72, 'BATMAN'),
	(73, '??IRNAK'),
	(74, 'BARTIN'),
	(75, 'ARDAHAN'),
	(76, 'I??DIR'),
	(77, 'YALOVA'),
	(78, 'KARAB??K'),
	(79, 'K??L??S'),
	(80, 'OSMAN??YE'),
	(81, 'D??ZCE');


--
-- Data for Name: Counties; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Counties" VALUES
	(0, 0, 'Se??iniz'),
	(1, 1, 'ALADA??'),
	(2, 1, 'CEYHAN'),
	(3, 1, '??UKUROVA'),
	(4, 1, 'FEKE'),
	(5, 1, '??MAMO??LU'),
	(6, 1, 'KARA??SALI'),
	(7, 1, 'KARATA??'),
	(8, 1, 'KOZAN'),
	(9, 1, 'POZANTI'),
	(10, 1, 'SA??MBEYL??'),
	(11, 1, 'SARI??AM'),
	(12, 1, 'SEYHAN'),
	(13, 1, 'TUFANBEYL??'),
	(14, 1, 'YUMURTALIK'),
	(15, 1, 'Y??RE????R'),
	(16, 2, 'BESN??'),
	(17, 2, '??EL??KHAN'),
	(18, 2, 'GERGER'),
	(19, 2, 'G??LBA??I'),
	(20, 2, 'KAHTA'),
	(21, 2, 'MERKEZ'),
	(22, 2, 'SAMSAT'),
	(23, 2, 'S??NC??K'),
	(24, 2, 'TUT'),
	(25, 3, 'BA??MAK??I'),
	(26, 3, 'BAYAT'),
	(27, 3, 'BOLVAD??N'),
	(28, 3, '??AY'),
	(29, 3, '??OBANLAR'),
	(30, 3, 'DAZKIRI'),
	(31, 3, 'D??NAR'),
	(32, 3, 'EM??RDA??'),
	(33, 3, 'EVC??LER'),
	(34, 3, 'HOCALAR'),
	(35, 3, '??HSAN??YE'),
	(36, 3, '??SCEH??SAR'),
	(37, 3, 'KIZIL??REN'),
	(38, 3, 'MERKEZ'),
	(39, 3, 'SANDIKLI'),
	(40, 3, 'S??NANPA??A'),
	(41, 3, 'SULTANDA??I'),
	(42, 3, '??UHUT'),
	(43, 4, 'D??YAD??N'),
	(44, 4, 'DO??UBAYAZIT'),
	(45, 4, 'ELE??K??RT'),
	(46, 4, 'HAMUR'),
	(47, 4, 'MERKEZ'),
	(48, 4, 'PATNOS'),
	(49, 4, 'TA??LI??AY'),
	(50, 4, 'TUTAK'),
	(51, 68, 'A??A????REN'),
	(52, 68, 'ESK??L'),
	(53, 68, 'G??LA??A??'),
	(54, 68, 'G??ZELYURT'),
	(55, 68, 'MERKEZ'),
	(56, 68, 'ORTAK??Y'),
	(57, 68, 'SARIYAH????'),
	(58, 68, 'SULTANHANI'),
	(59, 5, 'G??YN??CEK'),
	(60, 5, 'G??M????HACIK??Y'),
	(61, 5, 'HAMAM??Z??'),
	(62, 5, 'MERKEZ'),
	(63, 5, 'MERZ??FON'),
	(64, 5, 'SULUOVA'),
	(65, 5, 'TA??OVA'),
	(66, 6, 'AKYURT'),
	(67, 6, 'ALTINDA??'),
	(68, 6, 'AYA??'),
	(69, 6, 'BALA'),
	(70, 6, 'BEYPAZARI'),
	(71, 6, '??AMLIDERE'),
	(72, 6, '??ANKAYA'),
	(73, 6, '??UBUK'),
	(74, 6, 'ELMADA??'),
	(75, 6, 'ET??MESGUT'),
	(76, 6, 'EVREN'),
	(77, 6, 'G??LBA??I'),
	(78, 6, 'G??D??L'),
	(79, 6, 'HAYMANA'),
	(80, 6, 'KAHRAMANKAZAN'),
	(81, 6, 'KALEC??K'),
	(82, 6, 'KE??????REN'),
	(83, 6, 'KIZILCAHAMAM'),
	(84, 6, 'MAMAK'),
	(85, 6, 'NALLIHAN'),
	(86, 6, 'POLATLI'),
	(87, 6, 'PURSAKLAR'),
	(88, 6, 'S??NCAN'),
	(89, 6, '??EREFL??KO??H??SAR'),
	(90, 6, 'YEN??MAHALLE'),
	(91, 7, 'AKSEK??'),
	(92, 7, 'AKSU'),
	(93, 7, 'ALANYA'),
	(94, 7, 'DEMRE'),
	(95, 7, 'D????EMEALTI'),
	(96, 7, 'ELMALI'),
	(97, 7, 'F??N??KE'),
	(98, 7, 'GAZ??PA??A'),
	(99, 7, 'G??NDO??MU??'),
	(100, 7, '??BRADI'),
	(101, 7, 'KA??'),
	(102, 7, 'KEMER'),
	(103, 7, 'KEPEZ'),
	(104, 7, 'KONYAALTI'),
	(105, 7, 'KORKUTEL??'),
	(106, 7, 'KUMLUCA'),
	(107, 7, 'MANAVGAT'),
	(108, 7, 'MURATPA??A'),
	(109, 7, 'SER??K'),
	(110, 75, '??ILDIR'),
	(111, 75, 'DAMAL'),
	(112, 75, 'G??LE'),
	(113, 75, 'HANAK'),
	(114, 75, 'MERKEZ'),
	(115, 75, 'POSOF'),
	(116, 8, 'ARDANU??'),
	(117, 8, 'ARHAV??'),
	(118, 8, 'BOR??KA'),
	(119, 8, 'HOPA'),
	(120, 8, 'KEMALPA??A'),
	(121, 8, 'MERKEZ'),
	(122, 8, 'MURGUL'),
	(123, 8, '??AV??AT'),
	(124, 8, 'YUSUFEL??'),
	(125, 9, 'BOZDO??AN'),
	(126, 9, 'BUHARKENT'),
	(127, 9, '????NE'),
	(128, 9, 'D??D??M'),
	(129, 9, 'EFELER'),
	(130, 9, 'GERMENC??K'),
	(131, 9, '??NC??RL??OVA'),
	(132, 9, 'KARACASU'),
	(133, 9, 'KARPUZLU'),
	(134, 9, 'KO??ARLI'),
	(135, 9, 'K????K'),
	(136, 9, 'KU??ADASI'),
	(137, 9, 'KUYUCAK'),
	(138, 9, 'NAZ??LL??'),
	(139, 9, 'S??KE'),
	(140, 9, 'SULTANH??SAR'),
	(141, 9, 'YEN??PAZAR'),
	(142, 10, 'ALTIEYL??L'),
	(143, 10, 'AYVALIK'),
	(144, 10, 'BALYA'),
	(145, 10, 'BANDIRMA'),
	(146, 10, 'B??GAD????'),
	(147, 10, 'BURHAN??YE'),
	(148, 10, 'DURSUNBEY'),
	(149, 10, 'EDREM??T'),
	(150, 10, 'ERDEK'),
	(151, 10, 'G??ME??'),
	(152, 10, 'G??NEN'),
	(153, 10, 'HAVRAN'),
	(154, 10, '??VR??ND??'),
	(155, 10, 'KARES??'),
	(156, 10, 'KEPSUT'),
	(157, 10, 'MANYAS'),
	(158, 10, 'MARMARA'),
	(159, 10, 'SAVA??TEPE'),
	(160, 10, 'SINDIRGI'),
	(161, 10, 'SUSURLUK'),
	(162, 74, 'AMASRA'),
	(163, 74, 'KURUCA????LE'),
	(164, 74, 'MERKEZ'),
	(165, 74, 'ULUS'),
	(166, 72, 'BE????R??'),
	(167, 72, 'GERC????'),
	(168, 72, 'HASANKEYF'),
	(169, 72, 'KOZLUK'),
	(170, 72, 'MERKEZ'),
	(171, 72, 'SASON'),
	(172, 69, 'AYDINTEPE'),
	(173, 69, 'DEM??R??Z??'),
	(174, 69, 'MERKEZ'),
	(175, 11, 'BOZ??Y??K'),
	(176, 11, 'G??LPAZARI'),
	(177, 11, '??NH??SAR'),
	(178, 11, 'MERKEZ'),
	(179, 11, 'OSMANEL??'),
	(180, 11, 'PAZARYER??'),
	(181, 11, 'S??????T'),
	(182, 11, 'YEN??PAZAR'),
	(183, 12, 'ADAKLI'),
	(184, 12, 'GEN??'),
	(185, 12, 'KARLIOVA'),
	(186, 12, 'K????I'),
	(187, 12, 'MERKEZ'),
	(188, 12, 'SOLHAN'),
	(189, 12, 'YAYLADERE'),
	(190, 12, 'YED??SU'),
	(191, 13, 'AD??LCEVAZ'),
	(192, 13, 'AHLAT'),
	(193, 13, 'G??ROYMAK'),
	(194, 13, 'H??ZAN'),
	(195, 13, 'MERKEZ'),
	(196, 13, 'MUTK??'),
	(197, 13, 'TATVAN'),
	(198, 14, 'D??RTD??VAN'),
	(199, 14, 'GEREDE'),
	(200, 14, 'G??YN??K'),
	(201, 14, 'KIBRISCIK'),
	(202, 14, 'MENGEN'),
	(203, 14, 'MERKEZ'),
	(204, 14, 'MUDURNU'),
	(205, 14, 'SEBEN'),
	(206, 14, 'YEN????A??A'),
	(207, 15, 'A??LASUN'),
	(208, 15, 'ALTINYAYLA'),
	(209, 15, 'BUCAK'),
	(210, 15, '??AVDIR'),
	(211, 15, '??ELT??K????'),
	(212, 15, 'G??LH??SAR'),
	(213, 15, 'KARAMANLI'),
	(214, 15, 'KEMER'),
	(215, 15, 'MERKEZ'),
	(216, 15, 'TEFENN??'),
	(217, 15, 'YE????LOVA'),
	(218, 16, 'B??Y??KORHAN'),
	(219, 16, 'GEML??K'),
	(220, 16, 'G??RSU'),
	(221, 16, 'HARMANCIK'),
	(222, 16, '??NEG??L'),
	(223, 16, '??ZN??K'),
	(224, 16, 'KARACABEY'),
	(225, 16, 'KELES'),
	(226, 16, 'KESTEL'),
	(227, 16, 'MUDANYA'),
	(228, 16, 'MUSTAFAKEMALPA??A'),
	(229, 16, 'N??L??FER'),
	(230, 16, 'ORHANEL??'),
	(231, 16, 'ORHANGAZ??'),
	(232, 16, 'OSMANGAZ??'),
	(233, 16, 'YEN????EH??R'),
	(234, 16, 'YILDIRIM'),
	(235, 17, 'AYVACIK'),
	(236, 17, 'BAYRAM????'),
	(237, 17, 'B??GA'),
	(238, 17, 'BOZCAADA'),
	(239, 17, '??AN'),
	(240, 17, 'ECEABAT'),
	(241, 17, 'EZ??NE'),
	(242, 17, 'GEL??BOLU'),
	(243, 17, 'G??K??EADA'),
	(244, 17, 'LAPSEK??'),
	(245, 17, 'MERKEZ'),
	(246, 17, 'YEN??CE'),
	(247, 18, 'ATKARACALAR'),
	(248, 18, 'BAYRAM??REN'),
	(249, 18, '??ERKE??');
INSERT INTO public."Counties" VALUES
	(250, 18, 'ELD??VAN'),
	(251, 18, 'ILGAZ'),
	(252, 18, 'KIZILIRMAK'),
	(253, 18, 'KORGUN'),
	(254, 18, 'KUR??UNLU'),
	(255, 18, 'MERKEZ'),
	(256, 18, 'ORTA'),
	(257, 18, '??ABAN??Z??'),
	(258, 18, 'YAPRAKLI'),
	(259, 19, 'ALACA'),
	(260, 19, 'BAYAT'),
	(261, 19, 'BO??AZKALE'),
	(262, 19, 'DODURGA'),
	(263, 19, '??SK??L??P'),
	(264, 19, 'KARGI'),
	(265, 19, 'LA????N'),
	(266, 19, 'MEC??T??Z??'),
	(267, 19, 'MERKEZ'),
	(268, 19, 'O??UZLAR'),
	(269, 19, 'ORTAK??Y'),
	(270, 19, 'OSMANCIK'),
	(271, 19, 'SUNGURLU'),
	(272, 19, 'U??URLUDA??'),
	(273, 20, 'ACIPAYAM'),
	(274, 20, 'BABADA??'),
	(275, 20, 'BAKLAN'),
	(276, 20, 'BEK??LL??'),
	(277, 20, 'BEYA??A??'),
	(278, 20, 'BOZKURT'),
	(279, 20, 'BULDAN'),
	(280, 20, '??AL'),
	(281, 20, '??AMEL??'),
	(282, 20, '??ARDAK'),
	(283, 20, '????VR??L'),
	(284, 20, 'G??NEY'),
	(285, 20, 'HONAZ'),
	(286, 20, 'KALE'),
	(287, 20, 'MERKEZEFEND??'),
	(288, 20, 'PAMUKKALE'),
	(289, 20, 'SARAYK??Y'),
	(290, 20, 'SER??NH??SAR'),
	(291, 20, 'TAVAS'),
	(292, 21, 'BA??LAR'),
	(293, 21, 'B??SM??L'),
	(294, 21, '??ERM??K'),
	(295, 21, '??INAR'),
	(296, 21, '????NG????'),
	(297, 21, 'D??CLE'),
	(298, 21, 'E????L'),
	(299, 21, 'ERGAN??'),
	(300, 21, 'HAN??'),
	(301, 21, 'HAZRO'),
	(302, 21, 'KAYAPINAR'),
	(303, 21, 'KOCAK??Y'),
	(304, 21, 'KULP'),
	(305, 21, 'L??CE'),
	(306, 21, 'S??LVAN'),
	(307, 21, 'SUR'),
	(308, 21, 'YEN????EH??R'),
	(309, 81, 'AK??AKOCA'),
	(310, 81, 'CUMAYER??'),
	(311, 81, '????L??ML??'),
	(312, 81, 'G??LYAKA'),
	(313, 81, 'G??M????OVA'),
	(314, 81, 'KAYNA??LI'),
	(315, 81, 'MERKEZ'),
	(316, 81, 'YI??ILCA'),
	(317, 22, 'ENEZ'),
	(318, 22, 'HAVSA'),
	(319, 22, '??PSALA'),
	(320, 22, 'KE??AN'),
	(321, 22, 'LALAPA??A'),
	(322, 22, 'MER????'),
	(323, 22, 'MERKEZ'),
	(324, 22, 'S??LO??LU'),
	(325, 22, 'UZUNK??PR??'),
	(326, 23, 'A??IN'),
	(327, 23, 'ALACAKAYA'),
	(328, 23, 'ARICAK'),
	(329, 23, 'BASK??L'),
	(330, 23, 'KARAKO??AN'),
	(331, 23, 'KEBAN'),
	(332, 23, 'KOVANCILAR'),
	(333, 23, 'MADEN'),
	(334, 23, 'MERKEZ'),
	(335, 23, 'PALU'),
	(336, 23, 'S??VR??CE'),
	(337, 24, '??AYIRLI'),
	(338, 24, '??L????'),
	(339, 24, 'KEMAH'),
	(340, 24, 'KEMAL??YE'),
	(341, 24, 'MERKEZ'),
	(342, 24, 'OTLUKBEL??'),
	(343, 24, 'REFAH??YE'),
	(344, 24, 'TERCAN'),
	(345, 24, '??Z??ML??'),
	(346, 25, 'A??KALE'),
	(347, 25, 'AZ??Z??YE'),
	(348, 25, '??AT'),
	(349, 25, 'HINIS'),
	(350, 25, 'HORASAN'),
	(351, 25, '??SP??R'),
	(352, 25, 'KARA??OBAN'),
	(353, 25, 'KARAYAZI'),
	(354, 25, 'K??PR??K??Y'),
	(355, 25, 'NARMAN'),
	(356, 25, 'OLTU'),
	(357, 25, 'OLUR'),
	(358, 25, 'PALAND??KEN'),
	(359, 25, 'PAS??NLER'),
	(360, 25, 'PAZARYOLU'),
	(361, 25, '??ENKAYA'),
	(362, 25, 'TEKMAN'),
	(363, 25, 'TORTUM'),
	(364, 25, 'UZUNDERE'),
	(365, 25, 'YAKUT??YE'),
	(366, 26, 'ALPU'),
	(367, 26, 'BEYL??KOVA'),
	(368, 26, '????FTELER'),
	(369, 26, 'G??NY??Z??'),
	(370, 26, 'HAN'),
	(371, 26, '??N??N??'),
	(372, 26, 'MAHMUD??YE'),
	(373, 26, 'M??HALGAZ??'),
	(374, 26, 'M??HALI????IK'),
	(375, 26, 'ODUNPAZARI'),
	(376, 26, 'SARICAKAYA'),
	(377, 26, 'SEY??TGAZ??'),
	(378, 26, 'S??VR??H??SAR'),
	(379, 26, 'TEPEBA??I'),
	(380, 27, 'ARABAN'),
	(381, 27, '??SLAH??YE'),
	(382, 27, 'KARKAMI??'),
	(383, 27, 'N??Z??P'),
	(384, 27, 'NURDA??I'),
	(385, 27, 'O??UZEL??'),
	(386, 27, '??AH??NBEY'),
	(387, 27, '??EH??TKAM??L'),
	(388, 27, 'YAVUZEL??'),
	(389, 28, 'ALUCRA'),
	(390, 28, 'BULANCAK'),
	(391, 28, '??AMOLUK'),
	(392, 28, '??ANAK??I'),
	(393, 28, 'DEREL??'),
	(394, 28, 'DO??ANKENT'),
	(395, 28, 'ESP??YE'),
	(396, 28, 'EYNES??L'),
	(397, 28, 'G??RELE'),
	(398, 28, 'G??CE'),
	(399, 28, 'KE??AP'),
	(400, 28, 'MERKEZ'),
	(401, 28, 'P??RAZ??Z'),
	(402, 28, '??EB??NKARAH??SAR'),
	(403, 28, 'T??REBOLU'),
	(404, 28, 'YA??LIDERE'),
	(405, 29, 'KELK??T'),
	(406, 29, 'K??SE'),
	(407, 29, 'K??RT??N'),
	(408, 29, 'MERKEZ'),
	(409, 29, '????RAN'),
	(410, 29, 'TORUL'),
	(411, 30, '??UKURCA'),
	(412, 30, 'DEREC??K'),
	(413, 30, 'MERKEZ'),
	(414, 30, '??EMD??NL??'),
	(415, 30, 'Y??KSEKOVA'),
	(416, 31, 'ALTIN??Z??'),
	(417, 31, 'ANTAKYA'),
	(418, 31, 'ARSUZ'),
	(419, 31, 'BELEN'),
	(420, 31, 'DEFNE'),
	(421, 31, 'D??RTYOL'),
	(422, 31, 'ERZ??N'),
	(423, 31, 'HASSA'),
	(424, 31, '??SKENDERUN'),
	(425, 31, 'KIRIKHAN'),
	(426, 31, 'KUMLU'),
	(427, 31, 'PAYAS'),
	(428, 31, 'REYHANLI'),
	(429, 31, 'SAMANDA??'),
	(430, 31, 'YAYLADA??I'),
	(431, 76, 'ARALIK'),
	(432, 76, 'KARAKOYUNLU'),
	(433, 76, 'MERKEZ'),
	(434, 76, 'TUZLUCA'),
	(435, 32, 'AKSU'),
	(436, 32, 'ATABEY'),
	(437, 32, 'E????RD??R'),
	(438, 32, 'GELENDOST'),
	(439, 32, 'G??NEN'),
	(440, 32, 'KE????BORLU'),
	(441, 32, 'MERKEZ'),
	(442, 32, 'SEN??RKENT'),
	(443, 32, 'S??T????LER'),
	(444, 32, '??ARK??KARAA??A??'),
	(445, 32, 'ULUBORLU'),
	(446, 32, 'YALVA??'),
	(447, 32, 'YEN????ARBADEML??'),
	(448, 34, 'ADALAR'),
	(449, 34, 'ARNAVUTK??Y'),
	(450, 34, 'ATA??EH??R'),
	(451, 34, 'AVCILAR'),
	(452, 34, 'BA??CILAR'),
	(453, 34, 'BAH??EL??EVLER'),
	(454, 34, 'BAKIRK??Y'),
	(455, 34, 'BA??AK??EH??R'),
	(456, 34, 'BAYRAMPA??A'),
	(457, 34, 'BE????KTA??'),
	(458, 34, 'BEYKOZ'),
	(459, 34, 'BEYL??KD??Z??'),
	(460, 34, 'BEYO??LU'),
	(461, 34, 'B??Y??K??EKMECE'),
	(462, 34, '??ATALCA'),
	(463, 34, '??EKMEK??Y'),
	(464, 34, 'ESENLER'),
	(465, 34, 'ESENYURT'),
	(466, 34, 'EY??PSULTAN'),
	(467, 34, 'FAT??H'),
	(468, 34, 'GAZ??OSMANPA??A'),
	(469, 34, 'G??NG??REN'),
	(470, 34, 'KADIK??Y'),
	(471, 34, 'KA??ITHANE'),
	(472, 34, 'KARTAL'),
	(473, 34, 'K??????K??EKMECE'),
	(474, 34, 'MALTEPE'),
	(475, 34, 'PEND??K'),
	(476, 34, 'SANCAKTEPE'),
	(477, 34, 'SARIYER'),
	(478, 34, 'S??L??VR??'),
	(479, 34, 'SULTANBEYL??'),
	(480, 34, 'SULTANGAZ??'),
	(481, 34, '????LE'),
	(482, 34, '??????L??'),
	(483, 34, 'TUZLA'),
	(484, 34, '??MRAN??YE'),
	(485, 34, '??SK??DAR'),
	(486, 34, 'ZEYT??NBURNU'),
	(487, 35, 'AL??A??A'),
	(488, 35, 'BAL??OVA'),
	(489, 35, 'BAYINDIR'),
	(490, 35, 'BAYRAKLI'),
	(491, 35, 'BERGAMA'),
	(492, 35, 'BEYDA??'),
	(493, 35, 'BORNOVA'),
	(494, 35, 'BUCA'),
	(495, 35, '??E??ME'),
	(496, 35, '??????L??'),
	(497, 35, 'D??K??L??'),
	(498, 35, 'FO??A'),
	(499, 35, 'GAZ??EM??R');
INSERT INTO public."Counties" VALUES
	(500, 35, 'G??ZELBAH??E'),
	(501, 35, 'KARABA??LAR'),
	(502, 35, 'KARABURUN'),
	(503, 35, 'KAR??IYAKA'),
	(504, 35, 'KEMALPA??A'),
	(505, 35, 'KINIK'),
	(506, 35, 'K??RAZ'),
	(507, 35, 'KONAK'),
	(508, 35, 'MENDERES'),
	(509, 35, 'MENEMEN'),
	(510, 35, 'NARLIDERE'),
	(511, 35, '??DEM????'),
	(512, 35, 'SEFER??H??SAR'),
	(513, 35, 'SEL??UK'),
	(514, 35, 'T??RE'),
	(515, 35, 'TORBALI'),
	(516, 35, 'URLA'),
	(517, 46, 'AF????N'),
	(518, 46, 'ANDIRIN'),
	(519, 46, '??A??LAYANCER??T'),
	(520, 46, 'DULKAD??RO??LU'),
	(521, 46, 'EK??N??Z??'),
	(522, 46, 'ELB??STAN'),
	(523, 46, 'G??KSUN'),
	(524, 46, 'NURHAK'),
	(525, 46, 'ON??K????UBAT'),
	(526, 46, 'PAZARCIK'),
	(527, 46, 'T??RKO??LU'),
	(528, 78, 'EFLAN??'),
	(529, 78, 'ESK??PAZAR'),
	(530, 78, 'MERKEZ'),
	(531, 78, 'OVACIK'),
	(532, 78, 'SAFRANBOLU'),
	(533, 78, 'YEN??CE'),
	(534, 70, 'AYRANCI'),
	(535, 70, 'BA??YAYLA'),
	(536, 70, 'ERMENEK'),
	(537, 70, 'KAZIMKARABEK??R'),
	(538, 70, 'MERKEZ'),
	(539, 70, 'SARIVEL??LER'),
	(540, 36, 'AKYAKA'),
	(541, 36, 'ARPA??AY'),
	(542, 36, 'D??GOR'),
	(543, 36, 'KA??IZMAN'),
	(544, 36, 'MERKEZ'),
	(545, 36, 'SARIKAMI??'),
	(546, 36, 'SEL??M'),
	(547, 36, 'SUSUZ'),
	(548, 37, 'ABANA'),
	(549, 37, 'A??LI'),
	(550, 37, 'ARA??'),
	(551, 37, 'AZDAVAY'),
	(552, 37, 'BOZKURT'),
	(553, 37, 'C??DE'),
	(554, 37, '??ATALZEYT??N'),
	(555, 37, 'DADAY'),
	(556, 37, 'DEVREKAN??'),
	(557, 37, 'DO??ANYURT'),
	(558, 37, 'HAN??N??'),
	(559, 37, '??HSANGAZ??'),
	(560, 37, '??NEBOLU'),
	(561, 37, 'K??RE'),
	(562, 37, 'MERKEZ'),
	(563, 37, 'PINARBA??I'),
	(564, 37, 'SEYD??LER'),
	(565, 37, '??ENPAZAR'),
	(566, 37, 'TA??K??PR??'),
	(567, 37, 'TOSYA'),
	(568, 38, 'AKKI??LA'),
	(569, 38, 'B??NYAN'),
	(570, 38, 'DEVEL??'),
	(571, 38, 'FELAH??YE'),
	(572, 38, 'HACILAR'),
	(573, 38, '??NCESU'),
	(574, 38, 'KOCAS??NAN'),
	(575, 38, 'MEL??KGAZ??'),
	(576, 38, '??ZVATAN'),
	(577, 38, 'PINARBA??I'),
	(578, 38, 'SARIO??LAN'),
	(579, 38, 'SARIZ'),
	(580, 38, 'TALAS'),
	(581, 38, 'TOMARZA'),
	(582, 38, 'YAHYALI'),
	(583, 38, 'YE????LH??SAR'),
	(584, 71, 'BAH??ILI'),
	(585, 71, 'BALI??EYH'),
	(586, 71, '??ELEB??'),
	(587, 71, 'DEL??CE'),
	(588, 71, 'KARAKE????L??'),
	(589, 71, 'KESK??N'),
	(590, 71, 'MERKEZ'),
	(591, 71, 'SULAKYURT'),
	(592, 71, 'YAH????HAN'),
	(593, 39, 'BABAESK??'),
	(594, 39, 'DEM??RK??Y'),
	(595, 39, 'KOF??AZ'),
	(596, 39, 'L??LEBURGAZ'),
	(597, 39, 'MERKEZ'),
	(598, 39, 'PEHL??VANK??Y'),
	(599, 39, 'PINARH??SAR'),
	(600, 39, 'V??ZE'),
	(601, 40, 'AK??AKENT'),
	(602, 40, 'AKPINAR'),
	(603, 40, 'BOZTEPE'),
	(604, 40, '??????EKDA??I'),
	(605, 40, 'KAMAN'),
	(606, 40, 'MERKEZ'),
	(607, 40, 'MUCUR'),
	(608, 79, 'ELBEYL??'),
	(609, 79, 'MERKEZ'),
	(610, 79, 'MUSABEYL??'),
	(611, 79, 'POLATEL??'),
	(612, 41, 'BA????SKELE'),
	(613, 41, '??AYIROVA'),
	(614, 41, 'DARICA'),
	(615, 41, 'DER??NCE'),
	(616, 41, 'D??LOVASI'),
	(617, 41, 'GEBZE'),
	(618, 41, 'G??LC??K'),
	(619, 41, '??ZM??T'),
	(620, 41, 'KANDIRA'),
	(621, 41, 'KARAM??RSEL'),
	(622, 41, 'KARTEPE'),
	(623, 41, 'K??RFEZ'),
	(624, 42, 'AHIRLI'),
	(625, 42, 'AK??REN'),
	(626, 42, 'AK??EH??R'),
	(627, 42, 'ALTINEK??N'),
	(628, 42, 'BEY??EH??R'),
	(629, 42, 'BOZKIR'),
	(630, 42, 'C??HANBEYL??'),
	(631, 42, '??ELT??K'),
	(632, 42, '??UMRA'),
	(633, 42, 'DERBENT'),
	(634, 42, 'DEREBUCAK'),
	(635, 42, 'DO??ANH??SAR'),
	(636, 42, 'EM??RGAZ??'),
	(637, 42, 'ERE??L??'),
	(638, 42, 'G??NEYSINIR'),
	(639, 42, 'HAD??M'),
	(640, 42, 'HALKAPINAR'),
	(641, 42, 'H??Y??K'),
	(642, 42, 'ILGIN'),
	(643, 42, 'KADINHANI'),
	(644, 42, 'KARAPINAR'),
	(645, 42, 'KARATAY'),
	(646, 42, 'KULU'),
	(647, 42, 'MERAM'),
	(648, 42, 'SARAY??N??'),
	(649, 42, 'SEL??UKLU'),
	(650, 42, 'SEYD????EH??R'),
	(651, 42, 'TA??KENT'),
	(652, 42, 'TUZLUK??U'),
	(653, 42, 'YALIH??Y??K'),
	(654, 42, 'YUNAK'),
	(655, 43, 'ALTINTA??'),
	(656, 43, 'ASLANAPA'),
	(657, 43, '??AVDARH??SAR'),
	(658, 43, 'DOMAN????'),
	(659, 43, 'DUMLUPINAR'),
	(660, 43, 'EMET'),
	(661, 43, 'GED??Z'),
	(662, 43, 'H??SARCIK'),
	(663, 43, 'MERKEZ'),
	(664, 43, 'PAZARLAR'),
	(665, 43, 'S??MAV'),
	(666, 43, '??APHANE'),
	(667, 43, 'TAV??ANLI'),
	(668, 44, 'AK??ADA??'),
	(669, 44, 'ARAPG??R'),
	(670, 44, 'ARGUVAN'),
	(671, 44, 'BATTALGAZ??'),
	(672, 44, 'DARENDE'),
	(673, 44, 'DO??AN??EH??R'),
	(674, 44, 'DO??ANYOL'),
	(675, 44, 'HEK??MHAN'),
	(676, 44, 'KALE'),
	(677, 44, 'KULUNCAK'),
	(678, 44, 'P??T??RGE'),
	(679, 44, 'YAZIHAN'),
	(680, 44, 'YE????LYURT'),
	(681, 45, 'AHMETL??'),
	(682, 45, 'AKH??SAR'),
	(683, 45, 'ALA??EH??R'),
	(684, 45, 'DEM??RC??'),
	(685, 45, 'G??LMARMARA'),
	(686, 45, 'G??RDES'),
	(687, 45, 'KIRKA??A??'),
	(688, 45, 'K??PR??BA??I'),
	(689, 45, 'KULA'),
	(690, 45, 'SAL??HL??'),
	(691, 45, 'SARIG??L'),
	(692, 45, 'SARUHANLI'),
	(693, 45, 'SELEND??'),
	(694, 45, 'SOMA'),
	(695, 45, '??EHZADELER'),
	(696, 45, 'TURGUTLU'),
	(697, 45, 'YUNUSEMRE'),
	(698, 47, 'ARTUKLU'),
	(699, 47, 'DARGE????T'),
	(700, 47, 'DER??K'),
	(701, 47, 'KIZILTEPE'),
	(702, 47, 'MAZIDA??I'),
	(703, 47, 'M??DYAT'),
	(704, 47, 'NUSAYB??N'),
	(705, 47, '??MERL??'),
	(706, 47, 'SAVUR'),
	(707, 47, 'YE????LL??'),
	(708, 33, 'AKDEN??Z'),
	(709, 33, 'ANAMUR'),
	(710, 33, 'AYDINCIK'),
	(711, 33, 'BOZYAZI'),
	(712, 33, '??AMLIYAYLA'),
	(713, 33, 'ERDEML??'),
	(714, 33, 'G??LNAR'),
	(715, 33, 'MEZ??TL??'),
	(716, 33, 'MUT'),
	(717, 33, 'S??L??FKE'),
	(718, 33, 'TARSUS'),
	(719, 33, 'TOROSLAR'),
	(720, 33, 'YEN????EH??R'),
	(721, 48, 'BODRUM'),
	(722, 48, 'DALAMAN'),
	(723, 48, 'DAT??A'),
	(724, 48, 'FETH??YE'),
	(725, 48, 'KAVAKLIDERE'),
	(726, 48, 'K??YCE????Z'),
	(727, 48, 'MARMAR??S'),
	(728, 48, 'MENTE??E'),
	(729, 48, 'M??LAS'),
	(730, 48, 'ORTACA'),
	(731, 48, 'SEYD??KEMER'),
	(732, 48, 'ULA'),
	(733, 48, 'YATA??AN'),
	(734, 49, 'BULANIK'),
	(735, 49, 'HASK??Y'),
	(736, 49, 'KORKUT'),
	(737, 49, 'MALAZG??RT'),
	(738, 49, 'MERKEZ'),
	(739, 49, 'VARTO'),
	(740, 50, 'ACIG??L'),
	(741, 50, 'AVANOS'),
	(742, 50, 'DER??NKUYU'),
	(743, 50, 'G??L??EH??R'),
	(744, 50, 'HACIBEKTA??'),
	(745, 50, 'KOZAKLI'),
	(746, 50, 'MERKEZ'),
	(747, 50, '??RG??P'),
	(748, 51, 'ALTUNH??SAR'),
	(749, 51, 'BOR');
INSERT INTO public."Counties" VALUES
	(750, 51, '??AMARDI'),
	(751, 51, '????FTL??K'),
	(752, 51, 'MERKEZ'),
	(753, 51, 'ULUKI??LA'),
	(754, 52, 'AKKU??'),
	(755, 52, 'ALTINORDU'),
	(756, 52, 'AYBASTI'),
	(757, 52, '??AMA??'),
	(758, 52, '??ATALPINAR'),
	(759, 52, '??AYBA??I'),
	(760, 52, 'FATSA'),
	(761, 52, 'G??LK??Y'),
	(762, 52, 'G??LYALI'),
	(763, 52, 'G??RGENTEPE'),
	(764, 52, '??K??ZCE'),
	(765, 52, 'KABAD??Z'),
	(766, 52, 'KABATA??'),
	(767, 52, 'KORGAN'),
	(768, 52, 'KUMRU'),
	(769, 52, 'MESUD??YE'),
	(770, 52, 'PER??EMBE'),
	(771, 52, 'ULUBEY'),
	(772, 52, '??NYE'),
	(773, 80, 'BAH??E'),
	(774, 80, 'D??Z??????'),
	(775, 80, 'HASANBEYL??'),
	(776, 80, 'KAD??RL??'),
	(777, 80, 'MERKEZ'),
	(778, 80, 'SUMBAS'),
	(779, 80, 'TOPRAKKALE'),
	(780, 53, 'ARDE??EN'),
	(781, 53, '??AMLIHEM????N'),
	(782, 53, '??AYEL??'),
	(783, 53, 'DEREPAZARI'),
	(784, 53, 'FINDIKLI'),
	(785, 53, 'G??NEYSU'),
	(786, 53, 'HEM????N'),
	(787, 53, '??K??ZDERE'),
	(788, 53, '??Y??DERE'),
	(789, 53, 'KALKANDERE'),
	(790, 53, 'MERKEZ'),
	(791, 53, 'PAZAR'),
	(792, 54, 'ADAPAZARI'),
	(793, 54, 'AKYAZI'),
	(794, 54, 'AR??F??YE'),
	(795, 54, 'ERENLER'),
	(796, 54, 'FER??ZL??'),
	(797, 54, 'GEYVE'),
	(798, 54, 'HENDEK'),
	(799, 54, 'KARAP??R??EK'),
	(800, 54, 'KARASU'),
	(801, 54, 'KAYNARCA'),
	(802, 54, 'KOCAAL??'),
	(803, 54, 'PAMUKOVA'),
	(804, 54, 'SAPANCA'),
	(805, 54, 'SERD??VAN'),
	(806, 54, 'S??????TL??'),
	(807, 54, 'TARAKLI'),
	(808, 55, '19 MAYIS'),
	(809, 55, 'ALA??AM'),
	(810, 55, 'ASARCIK'),
	(811, 55, 'ATAKUM'),
	(812, 55, 'AYVACIK'),
	(813, 55, 'BAFRA'),
	(814, 55, 'CAN??K'),
	(815, 55, '??AR??AMBA'),
	(816, 55, 'HAVZA'),
	(817, 55, '??LKADIM'),
	(818, 55, 'KAVAK'),
	(819, 55, 'LAD??K'),
	(820, 55, 'SALIPAZARI'),
	(821, 55, 'TEKKEK??Y'),
	(822, 55, 'TERME'),
	(823, 55, 'VEZ??RK??PR??'),
	(824, 55, 'YAKAKENT'),
	(825, 56, 'BAYKAN'),
	(826, 56, 'ERUH'),
	(827, 56, 'KURTALAN'),
	(828, 56, 'MERKEZ'),
	(829, 56, 'PERVAR??'),
	(830, 56, '????RVAN'),
	(831, 56, 'T??LLO'),
	(832, 57, 'AYANCIK'),
	(833, 57, 'BOYABAT'),
	(834, 57, 'D??KMEN'),
	(835, 57, 'DURA??AN'),
	(836, 57, 'ERFELEK'),
	(837, 57, 'GERZE'),
	(838, 57, 'MERKEZ'),
	(839, 57, 'SARAYD??Z??'),
	(840, 57, 'T??RKEL??'),
	(841, 58, 'AKINCILAR'),
	(842, 58, 'ALTINYAYLA'),
	(843, 58, 'D??VR??????'),
	(844, 58, 'DO??AN??AR'),
	(845, 58, 'GEMEREK'),
	(846, 58, 'G??LOVA'),
	(847, 58, 'G??R??N'),
	(848, 58, 'HAF??K'),
	(849, 58, '??MRANLI'),
	(850, 58, 'KANGAL'),
	(851, 58, 'KOYULH??SAR'),
	(852, 58, 'MERKEZ'),
	(853, 58, 'SU??EHR??'),
	(854, 58, '??ARKI??LA'),
	(855, 58, 'ULA??'),
	(856, 58, 'YILDIZEL??'),
	(857, 58, 'ZARA'),
	(858, 63, 'AK??AKALE'),
	(859, 63, 'B??REC??K'),
	(860, 63, 'BOZOVA'),
	(861, 63, 'CEYLANPINAR'),
	(862, 63, 'EYY??B??YE'),
	(863, 63, 'HALFET??'),
	(864, 63, 'HAL??L??YE'),
	(865, 63, 'HARRAN'),
	(866, 63, 'H??LVAN'),
	(867, 63, 'KARAK??PR??'),
	(868, 63, 'S??VEREK'),
	(869, 63, 'SURU??'),
	(870, 63, 'V??RAN??EH??R'),
	(871, 73, 'BEYT??????EBAP'),
	(872, 73, 'C??ZRE'),
	(873, 73, 'G????L??KONAK'),
	(874, 73, '??D??L'),
	(875, 73, 'MERKEZ'),
	(876, 73, 'S??LOP??'),
	(877, 73, 'ULUDERE'),
	(878, 59, '??ERKEZK??Y'),
	(879, 59, '??ORLU'),
	(880, 59, 'ERGENE'),
	(881, 59, 'HAYRABOLU'),
	(882, 59, 'KAPAKLI'),
	(883, 59, 'MALKARA'),
	(884, 59, 'MARMARAERE??L??S??'),
	(885, 59, 'MURATLI'),
	(886, 59, 'SARAY'),
	(887, 59, 'S??LEYMANPA??A'),
	(888, 59, '??ARK??Y'),
	(889, 60, 'ALMUS'),
	(890, 60, 'ARTOVA'),
	(891, 60, 'BA??????FTL??K'),
	(892, 60, 'ERBAA'),
	(893, 60, 'MERKEZ'),
	(894, 60, 'N??KSAR'),
	(895, 60, 'PAZAR'),
	(896, 60, 'RE??AD??YE'),
	(897, 60, 'SULUSARAY'),
	(898, 60, 'TURHAL'),
	(899, 60, 'YE????LYURT'),
	(900, 60, 'Z??LE'),
	(901, 61, 'AK??AABAT'),
	(902, 61, 'ARAKLI'),
	(903, 61, 'ARS??N'),
	(904, 61, 'BE????KD??Z??'),
	(905, 61, '??AR??IBA??I'),
	(906, 61, '??AYKARA'),
	(907, 61, 'DERNEKPAZARI'),
	(908, 61, 'D??ZK??Y'),
	(909, 61, 'HAYRAT'),
	(910, 61, 'K??PR??BA??I'),
	(911, 61, 'MA??KA'),
	(912, 61, 'OF'),
	(913, 61, 'ORTAH??SAR'),
	(914, 61, 'S??RMENE'),
	(915, 61, '??ALPAZARI'),
	(916, 61, 'TONYA'),
	(917, 61, 'VAKFIKEB??R'),
	(918, 61, 'YOMRA'),
	(919, 62, 'HOZAT'),
	(920, 62, 'MAZG??RT'),
	(921, 62, 'MERKEZ'),
	(922, 62, 'NAZIM??YE'),
	(923, 62, 'OVACIK'),
	(924, 62, 'PERTEK'),
	(925, 62, 'P??L??M??R'),
	(926, 64, 'BANAZ'),
	(927, 64, 'E??ME'),
	(928, 64, 'KARAHALLI'),
	(929, 64, 'MERKEZ'),
	(930, 64, 'S??VASLI'),
	(931, 64, 'ULUBEY'),
	(932, 65, 'BAH??ESARAY'),
	(933, 65, 'BA??KALE'),
	(934, 65, '??ALDIRAN'),
	(935, 65, '??ATAK'),
	(936, 65, 'EDREM??T'),
	(937, 65, 'ERC????'),
	(938, 65, 'GEVA??'),
	(939, 65, 'G??RPINAR'),
	(940, 65, '??PEKYOLU'),
	(941, 65, 'MURAD??YE'),
	(942, 65, '??ZALP'),
	(943, 65, 'SARAY'),
	(944, 65, 'TU??BA'),
	(945, 77, 'ALTINOVA'),
	(946, 77, 'ARMUTLU'),
	(947, 77, '??INARCIK'),
	(948, 77, '????FTL??KK??Y'),
	(949, 77, 'MERKEZ'),
	(950, 77, 'TERMAL'),
	(951, 66, 'AKDA??MADEN??'),
	(952, 66, 'AYDINCIK'),
	(953, 66, 'BO??AZLIYAN'),
	(954, 66, '??ANDIR'),
	(955, 66, '??AYIRALAN'),
	(956, 66, '??EKEREK'),
	(957, 66, 'KADI??EHR??'),
	(958, 66, 'MERKEZ'),
	(959, 66, 'SARAYKENT'),
	(960, 66, 'SARIKAYA'),
	(961, 66, 'SORGUN'),
	(962, 66, '??EFAATL??'),
	(963, 66, 'YEN??FAKILI'),
	(964, 66, 'YERK??Y'),
	(965, 67, 'ALAPLI'),
	(966, 67, '??AYCUMA'),
	(967, 67, 'DEVREK'),
	(968, 67, 'ERE??L??'),
	(969, 67, 'G??K??EBEY'),
	(970, 67, 'K??L??ML??'),
	(971, 67, 'KOZLU'),
	(972, 67, 'MERKEZ');


--
-- Data for Name: Departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Departments" VALUES
	(0, 'Se??iniz'),
	(1, 'MEDYA VE ??LETI??IM'),
	(2, 'FINANS'),
	(3, 'HUKUK'),
	(4, 'OPERASYON'),
	(5, '??LETI??IM'),
	(6, 'PAZARLAMA'),
	(7, 'YAZ??L??M');


--
-- Data for Name: Directors; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Directors" VALUES
	(0, '-Se??iniz', '-'),
	(1, '??MER FARUK', 'SORAK'),
	(2, 'ALI TANER', 'BALTAC??'),
	(3, 'AT??L', '??NAN??'),
	(4, 'MEHMET ADA', '??ZTEKIN'),
	(5, 'Y??LMAZ', 'ERDO??AN'),
	(6, '??A??AN', 'IRMAK'),
	(7, 'SERDAR', 'AKAR');


--
-- Data for Name: Employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Employees" VALUES
	(0, '-Se??iniz', '-', '12345678900', 'adsoyad@gmail.com', 0, 0, 0),
	(1, 'EMRE', 'AK??NC??', '5321418881', 'yunus.akinci1@ogr.sakarya.edu.tr', 7, 54, 805),
	(2, 'ALI', '??AFAK', '5392544131', 'alisafak@gmail.com', 1, 34, 455),
	(3, 'ARDA', 'TURAN', '5369480034', 'ardaturan@gmail.com', 4, 34, 456),
	(4, 'ALI', 'KO??', '5456128982', 'alikoc@gmail.com', 2, 34, 468),
	(5, 'HAKAN', 'ADALETO??LU', '5439870126', 'adaletogluhakan@gmail.com', 3, 6, 90),
	(6, 'AY??E', 'ACAR', '5331224454', 'ayseacar@gmail.com', 5, 34, 465),
	(7, 'FATMA', 'BAK??RC??O??LU', '5331224454', 'fatmabakircioglu@gmail.com', 6, 34, 470);


--
-- Data for Name: Managers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Managers" VALUES
	(0, '-Se??iniz', '-'),
	(1, 'MUHARREM', 'AYG??N'),
	(2, 'RASIM OZAN', 'K??TAHYAL??'),
	(3, 'SINAN', 'ENGIN'),
	(4, 'ERTEM', '??ENER'),
	(5, 'ABDULKERIM', 'DURMAZ'),
	(6, 'ACUN', 'KAPL??CAL??'),
	(7, 'ESAT', 'YONTUN??'),
	(8, 'ALI R??ZA SERGEN', 'YAL????N');


--
-- Data for Name: MovieActors; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."MovieActors" VALUES
	(1, 'Arif I????k', 1, 1),
	(2, 'Bob Marley Faruk', 1, 2),
	(3, 'Garavel Usta', 1, 3),
	(4, 'Robot 216', 1, 4),
	(5, 'Kuna', 1, 6),
	(6, 'Ceku', 1, 9),
	(7, 'Rendroy', 1, 19),
	(8, 'Arif I????k', 2, 1),
	(9, 'Dimi', 2, 3),
	(10, 'Taso', 2, 4),
	(11, 'Ceku', 2, 9),
	(12, 'Mimi', 2, 10),
	(13, '??zg??r', 3, 6),
	(14, 'Sabri Abi', 3, 12),
	(15, 'Galerici ??ahin', 3, 13),
	(16, 'Memo', 4, 14),
	(17, 'Askorozlu', 4, 16),
	(18, 'M??d??r Nail', 4, 15),
	(19, 'As??m Noyan', 5, 5),
	(20, 'M??sl??m Duralmaz', 5, 1),
	(21, 'S??permen Samet', 5, 17),
	(22, 'Umut Ocak', 5, 18),
	(23, '??zeyir Kavak', 5, 19),
	(24, 'Silvio', 5, 20),
	(25, '??lyas Bazna', 7, 7),
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
	(3, 'KOLPA??INO', '2009-10-29', 3, 3),
	(4, '7. KO??U??TAKI MUCIZE', '2019-10-11', 4, 3),
	(5, 'ORGANIZE ????LER', '2005-11-30', 5, 3),
	(6, 'BABAM VE O??LUM', '2005-11-18', 6, 3),
	(7, '??I??ERO', '2019-01-18', 7, 3);


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
	(1, 'Mesut', '??zil', '5456706767', 'm10@gmail.com', 3, 67, 967),
	(2, 'Bur??in', '??olako??lu', '5331345464', 'burcincolakogluk@gmail.com', 1, 34, 450),
	(3, 'Burak', 'Dere', '5367642202', 'burakdere@gmail.com', 2, 54, 805),
	(4, 'Mete', 'Tan', '5364455406', 'metetan@gmail.com', 2, 54, 805),
	(5, 'Enes', 'Ak??nc??', '5369431122', 'enesakinci@gmail.com', 2, 54, 805),
	(6, 'Serdar', 'Dursun', '5431233434', 'dursunserdar@gmail.com', 1, 34, 470),
	(7, 'Beytullah', 'Yayla', '5322075454', 'beytullahyayla@gmail.com', 2, 54, 805),
	(8, 'Kutay', 'Dalg????', '5356175406', 'dalgickutay@gmail.com', 2, 6, 72),
	(9, 'Emirhan', 'Usta', '5451235455', 'emirhanusta@gmail.com', 2, 55, 815),
	(10, 'Sercan', '??zer', '53674354', 'sercanozer@gmail.com', 2, 47, 703),
	(11, 'Mustafa', '??nl??', '5340345434', 'unlumustafa@gmail.com', 2, 34, 455),
	(12, 'Mehmet', 'Ar??', '5342155434', 'mehmetari@gmail.com', 2, 34, 455),
	(13, 'Yusuf', 'Yesin', '5436115434', 'dalgickutay@gmail.com', 2, 34, 459),
	(14, 'Melih', '??zmen', '53312354', 'dalgickutay@gmail.com', 2, 60, 894),
	(15, 'Yi??it Alp', 'Alan', '5312433454', 'ygtalan@gmail.com', 1, 54, 792),
	(16, 'Kerem Bilal', 'Yaz??c??', '5326145454', 'krmbllyzc@gmail.com', 1, 54, 792),
	(17, 'Mehmet Can', '??ilingir', '5310543154', 'mhmtcnclngr@gmail.com', 1, 54, 792),
	(18, 'Enes', 'Fidan', '5364435416', 'enesfidan@gmail.com', 3, 54, 805),
	(19, 'Eray', 'Turan', '5312315454', 'eright@gmail.com', 1, 54, 805),
	(20, 'Furkan', 'Kara', '5436745454', 'dark.furkan@gmail.com', 2, 54, 805),
	(21, 'Emirhan', '??ok', '5326311654', 'emirhancok54@gmail.com', 3, 54, 805),
	(22, '??mer', 'Bayrak', '5416414154', 'omerbayraktc@gmail.com', 3, 41, 619),
	(23, 'Berke', '??zer', '5343413434', 'ozerberke@gmail.com', 4, 34, 470),
	(24, 'Ferdi', 'Kad??o??lu', '5367670034', 'ferdikadioglu@gmail.com', 4, 34, 470),
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

