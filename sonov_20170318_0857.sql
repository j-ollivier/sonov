PGDMP         9                u            sonov_d    9.5.6    9.5.6 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    65131    sonov_d    DATABASE     y   CREATE DATABASE sonov_d WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'fr_FR.UTF-8' LC_CTYPE = 'fr_FR.UTF-8';
    DROP DATABASE sonov_d;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    7            �           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    7                        3079    12363    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1                        3079    65132    postgis 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
    DROP EXTENSION postgis;
                  false    7            �           0    0    EXTENSION postgis    COMMENT     g   COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';
                       false    2            �            1259    66645 
   auth_group    TABLE     ^   CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);
    DROP TABLE public.auth_group;
       public      
   sonovadmin    false    7            �            1259    66643    auth_group_id_seq    SEQUENCE     s   CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public    
   sonovadmin    false    204    7            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;
            public    
   sonovadmin    false    203            �            1259    66655    auth_group_permissions    TABLE     �   CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public      
   sonovadmin    false    7            �            1259    66653    auth_group_permissions_id_seq    SEQUENCE        CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public    
   sonovadmin    false    7    206            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;
            public    
   sonovadmin    false    205            �            1259    66637    auth_permission    TABLE     �   CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public      
   sonovadmin    false    7            �            1259    66635    auth_permission_id_seq    SEQUENCE     x   CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public    
   sonovadmin    false    7    202            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;
            public    
   sonovadmin    false    201            �            1259    66663 	   auth_user    TABLE     �  CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public      
   sonovadmin    false    7            �            1259    66673    auth_user_groups    TABLE     x   CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public      
   sonovadmin    false    7            �            1259    66671    auth_user_groups_id_seq    SEQUENCE     y   CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public    
   sonovadmin    false    7    210            �           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;
            public    
   sonovadmin    false    209            �            1259    66661    auth_user_id_seq    SEQUENCE     r   CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public    
   sonovadmin    false    208    7            �           0    0    auth_user_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;
            public    
   sonovadmin    false    207            �            1259    66681    auth_user_user_permissions    TABLE     �   CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public      
   sonovadmin    false    7            �            1259    66679 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public    
   sonovadmin    false    7    212            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;
            public    
   sonovadmin    false    211            �            1259    66741    django_admin_log    TABLE     �  CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public      
   sonovadmin    false    7            �            1259    66739    django_admin_log_id_seq    SEQUENCE     y   CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public    
   sonovadmin    false    7    214            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;
            public    
   sonovadmin    false    213            �            1259    66627    django_content_type    TABLE     �   CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public      
   sonovadmin    false    7            �            1259    66625    django_content_type_id_seq    SEQUENCE     |   CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public    
   sonovadmin    false    200    7            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;
            public    
   sonovadmin    false    199            �            1259    66616    django_migrations    TABLE     �   CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public      
   sonovadmin    false    7            �            1259    66614    django_migrations_id_seq    SEQUENCE     z   CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public    
   sonovadmin    false    198    7            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;
            public    
   sonovadmin    false    197            �            1259    66770    django_session    TABLE     �   CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public      
   sonovadmin    false    7            �            1259    66782    sonovsite_article    TABLE     �  CREATE TABLE sonovsite_article (
    uid integer NOT NULL,
    slug character varying(50) NOT NULL,
    title character varying(255) NOT NULL,
    corpus text,
    short_desc character varying(78),
    thumbnail character varying(100),
    is_visible boolean NOT NULL,
    created_date timestamp with time zone NOT NULL,
    modified_date timestamp with time zone NOT NULL,
    posted_by_id integer NOT NULL
);
 %   DROP TABLE public.sonovsite_article;
       public      
   sonovadmin    false    7            �            1259    66847    sonovsite_article_tags    TABLE        CREATE TABLE sonovsite_article_tags (
    id integer NOT NULL,
    article_id integer NOT NULL,
    tag_id integer NOT NULL
);
 *   DROP TABLE public.sonovsite_article_tags;
       public      
   sonovadmin    false    7            �            1259    66845    sonovsite_article_tags_id_seq    SEQUENCE        CREATE SEQUENCE sonovsite_article_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.sonovsite_article_tags_id_seq;
       public    
   sonovadmin    false    231    7            �           0    0    sonovsite_article_tags_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE sonovsite_article_tags_id_seq OWNED BY sonovsite_article_tags.id;
            public    
   sonovadmin    false    230            �            1259    66780    sonovsite_article_uid_seq    SEQUENCE     {   CREATE SEQUENCE sonovsite_article_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.sonovsite_article_uid_seq;
       public    
   sonovadmin    false    7    217            �           0    0    sonovsite_article_uid_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE sonovsite_article_uid_seq OWNED BY sonovsite_article.uid;
            public    
   sonovadmin    false    216            �            1259    66793    sonovsite_galery    TABLE     c  CREATE TABLE sonovsite_galery (
    uid integer NOT NULL,
    title character varying(100) NOT NULL,
    is_visible boolean NOT NULL,
    slug character varying(50) NOT NULL,
    posted_by_id integer NOT NULL,
    thumbnail character varying(100),
    created_date timestamp with time zone NOT NULL,
    modified_date timestamp with time zone NOT NULL
);
 $   DROP TABLE public.sonovsite_galery;
       public      
   sonovadmin    false    7            �            1259    66839    sonovsite_galery_content    TABLE     �   CREATE TABLE sonovsite_galery_content (
    id integer NOT NULL,
    galery_id integer NOT NULL,
    image_id integer NOT NULL
);
 ,   DROP TABLE public.sonovsite_galery_content;
       public      
   sonovadmin    false    7            �            1259    66837    sonovsite_galery_content_id_seq    SEQUENCE     �   CREATE SEQUENCE sonovsite_galery_content_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.sonovsite_galery_content_id_seq;
       public    
   sonovadmin    false    229    7            �           0    0    sonovsite_galery_content_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE sonovsite_galery_content_id_seq OWNED BY sonovsite_galery_content.id;
            public    
   sonovadmin    false    228            �            1259    66791    sonovsite_galery_uid_seq    SEQUENCE     z   CREATE SEQUENCE sonovsite_galery_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.sonovsite_galery_uid_seq;
       public    
   sonovadmin    false    219    7            �           0    0    sonovsite_galery_uid_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE sonovsite_galery_uid_seq OWNED BY sonovsite_galery.uid;
            public    
   sonovadmin    false    218            �            1259    66801    sonovsite_image    TABLE       CREATE TABLE sonovsite_image (
    uid integer NOT NULL,
    title character varying(255) NOT NULL,
    thumbnail character varying(100) NOT NULL,
    full_img character varying(100) NOT NULL,
    external_link character varying(500),
    legend character varying(500)
);
 #   DROP TABLE public.sonovsite_image;
       public      
   sonovadmin    false    7            �            1259    66799    sonovsite_image_uid_seq    SEQUENCE     y   CREATE SEQUENCE sonovsite_image_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.sonovsite_image_uid_seq;
       public    
   sonovadmin    false    221    7            �           0    0    sonovsite_image_uid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE sonovsite_image_uid_seq OWNED BY sonovsite_image.uid;
            public    
   sonovadmin    false    220            �            1259    66812    sonovsite_son    TABLE     �  CREATE TABLE sonovsite_son (
    uid integer NOT NULL,
    title character varying(255) NOT NULL,
    thumbnail character varying(100) NOT NULL,
    start_video_at character varying(50) NOT NULL,
    created_date timestamp with time zone NOT NULL,
    short_desc character varying(78),
    source_site character varying(50) NOT NULL,
    source_id_string character varying(100) NOT NULL,
    posted_by_id integer NOT NULL,
    is_visible boolean NOT NULL,
    modified_date timestamp with time zone NOT NULL
);
 !   DROP TABLE public.sonovsite_son;
       public      
   sonovadmin    false    7            �            1259    66831    sonovsite_son_tags    TABLE     w   CREATE TABLE sonovsite_son_tags (
    id integer NOT NULL,
    son_id integer NOT NULL,
    tag_id integer NOT NULL
);
 &   DROP TABLE public.sonovsite_son_tags;
       public      
   sonovadmin    false    7            �            1259    66829    sonovsite_son_tags_id_seq    SEQUENCE     {   CREATE SEQUENCE sonovsite_son_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.sonovsite_son_tags_id_seq;
       public    
   sonovadmin    false    7    227            �           0    0    sonovsite_son_tags_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE sonovsite_son_tags_id_seq OWNED BY sonovsite_son_tags.id;
            public    
   sonovadmin    false    226            �            1259    66810    sonovsite_son_uid_seq    SEQUENCE     w   CREATE SEQUENCE sonovsite_son_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.sonovsite_son_uid_seq;
       public    
   sonovadmin    false    223    7            �           0    0    sonovsite_son_uid_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE sonovsite_son_uid_seq OWNED BY sonovsite_son.uid;
            public    
   sonovadmin    false    222            �            1259    66823    sonovsite_tag    TABLE     d   CREATE TABLE sonovsite_tag (
    uid integer NOT NULL,
    title character varying(100) NOT NULL
);
 !   DROP TABLE public.sonovsite_tag;
       public      
   sonovadmin    false    7            �            1259    66821    sonovsite_tag_uid_seq    SEQUENCE     w   CREATE SEQUENCE sonovsite_tag_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.sonovsite_tag_uid_seq;
       public    
   sonovadmin    false    7    225            �           0    0    sonovsite_tag_uid_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE sonovsite_tag_uid_seq OWNED BY sonovsite_tag.uid;
            public    
   sonovadmin    false    224            �           2604    66648    id    DEFAULT     `   ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public    
   sonovadmin    false    204    203    204            �           2604    66658    id    DEFAULT     x   ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public    
   sonovadmin    false    205    206    206            �           2604    66640    id    DEFAULT     j   ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public    
   sonovadmin    false    201    202    202            �           2604    66666    id    DEFAULT     ^   ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public    
   sonovadmin    false    207    208    208            �           2604    66676    id    DEFAULT     l   ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public    
   sonovadmin    false    210    209    210            �           2604    66684    id    DEFAULT     �   ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public    
   sonovadmin    false    212    211    212            �           2604    66744    id    DEFAULT     l   ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public    
   sonovadmin    false    214    213    214            �           2604    66630    id    DEFAULT     r   ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public    
   sonovadmin    false    199    200    200            �           2604    66619    id    DEFAULT     n   ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public    
   sonovadmin    false    197    198    198            �           2604    66785    uid    DEFAULT     p   ALTER TABLE ONLY sonovsite_article ALTER COLUMN uid SET DEFAULT nextval('sonovsite_article_uid_seq'::regclass);
 D   ALTER TABLE public.sonovsite_article ALTER COLUMN uid DROP DEFAULT;
       public    
   sonovadmin    false    216    217    217            �           2604    66850    id    DEFAULT     x   ALTER TABLE ONLY sonovsite_article_tags ALTER COLUMN id SET DEFAULT nextval('sonovsite_article_tags_id_seq'::regclass);
 H   ALTER TABLE public.sonovsite_article_tags ALTER COLUMN id DROP DEFAULT;
       public    
   sonovadmin    false    231    230    231            �           2604    66796    uid    DEFAULT     n   ALTER TABLE ONLY sonovsite_galery ALTER COLUMN uid SET DEFAULT nextval('sonovsite_galery_uid_seq'::regclass);
 C   ALTER TABLE public.sonovsite_galery ALTER COLUMN uid DROP DEFAULT;
       public    
   sonovadmin    false    218    219    219            �           2604    66842    id    DEFAULT     |   ALTER TABLE ONLY sonovsite_galery_content ALTER COLUMN id SET DEFAULT nextval('sonovsite_galery_content_id_seq'::regclass);
 J   ALTER TABLE public.sonovsite_galery_content ALTER COLUMN id DROP DEFAULT;
       public    
   sonovadmin    false    229    228    229            �           2604    66804    uid    DEFAULT     l   ALTER TABLE ONLY sonovsite_image ALTER COLUMN uid SET DEFAULT nextval('sonovsite_image_uid_seq'::regclass);
 B   ALTER TABLE public.sonovsite_image ALTER COLUMN uid DROP DEFAULT;
       public    
   sonovadmin    false    220    221    221            �           2604    66815    uid    DEFAULT     h   ALTER TABLE ONLY sonovsite_son ALTER COLUMN uid SET DEFAULT nextval('sonovsite_son_uid_seq'::regclass);
 @   ALTER TABLE public.sonovsite_son ALTER COLUMN uid DROP DEFAULT;
       public    
   sonovadmin    false    222    223    223            �           2604    66834    id    DEFAULT     p   ALTER TABLE ONLY sonovsite_son_tags ALTER COLUMN id SET DEFAULT nextval('sonovsite_son_tags_id_seq'::regclass);
 D   ALTER TABLE public.sonovsite_son_tags ALTER COLUMN id DROP DEFAULT;
       public    
   sonovadmin    false    227    226    227            �           2604    66826    uid    DEFAULT     h   ALTER TABLE ONLY sonovsite_tag ALTER COLUMN uid SET DEFAULT nextval('sonovsite_tag_uid_seq'::regclass);
 @   ALTER TABLE public.sonovsite_tag ALTER COLUMN uid DROP DEFAULT;
       public    
   sonovadmin    false    224    225    225            �          0    66645 
   auth_group 
   TABLE DATA               '   COPY auth_group (id, name) FROM stdin;
    public    
   sonovadmin    false    204   ��       �           0    0    auth_group_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('auth_group_id_seq', 1, false);
            public    
   sonovadmin    false    203            �          0    66655    auth_group_permissions 
   TABLE DATA               F   COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public    
   sonovadmin    false    206   ��       �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);
            public    
   sonovadmin    false    205            �          0    66637    auth_permission 
   TABLE DATA               G   COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
    public    
   sonovadmin    false    202   ��       �           0    0    auth_permission_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('auth_permission_id_seq', 33, true);
            public    
   sonovadmin    false    201            �          0    66663 	   auth_user 
   TABLE DATA               �   COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public    
   sonovadmin    false    208   <�       �          0    66673    auth_user_groups 
   TABLE DATA               :   COPY auth_user_groups (id, user_id, group_id) FROM stdin;
    public    
   sonovadmin    false    210   ��       �           0    0    auth_user_groups_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);
            public    
   sonovadmin    false    209            �           0    0    auth_user_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('auth_user_id_seq', 1, true);
            public    
   sonovadmin    false    207            �          0    66681    auth_user_user_permissions 
   TABLE DATA               I   COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public    
   sonovadmin    false    212    �       �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);
            public    
   sonovadmin    false    211            �          0    66741    django_admin_log 
   TABLE DATA               �   COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public    
   sonovadmin    false    214   �       �           0    0    django_admin_log_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('django_admin_log_id_seq', 70, true);
            public    
   sonovadmin    false    213            �          0    66627    django_content_type 
   TABLE DATA               <   COPY django_content_type (id, app_label, model) FROM stdin;
    public    
   sonovadmin    false    200   ��       �           0    0    django_content_type_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('django_content_type_id_seq', 11, true);
            public    
   sonovadmin    false    199            �          0    66616    django_migrations 
   TABLE DATA               <   COPY django_migrations (id, app, name, applied) FROM stdin;
    public    
   sonovadmin    false    198   +�       �           0    0    django_migrations_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('django_migrations_id_seq', 21, true);
            public    
   sonovadmin    false    197            �          0    66770    django_session 
   TABLE DATA               I   COPY django_session (session_key, session_data, expire_date) FROM stdin;
    public    
   sonovadmin    false    215   '�       �          0    66782    sonovsite_article 
   TABLE DATA               �   COPY sonovsite_article (uid, slug, title, corpus, short_desc, thumbnail, is_visible, created_date, modified_date, posted_by_id) FROM stdin;
    public    
   sonovadmin    false    217   A�       �          0    66847    sonovsite_article_tags 
   TABLE DATA               A   COPY sonovsite_article_tags (id, article_id, tag_id) FROM stdin;
    public    
   sonovadmin    false    231   ��       �           0    0    sonovsite_article_tags_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('sonovsite_article_tags_id_seq', 10, true);
            public    
   sonovadmin    false    230            �           0    0    sonovsite_article_uid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('sonovsite_article_uid_seq', 3, true);
            public    
   sonovadmin    false    216            �          0    66793    sonovsite_galery 
   TABLE DATA               w   COPY sonovsite_galery (uid, title, is_visible, slug, posted_by_id, thumbnail, created_date, modified_date) FROM stdin;
    public    
   sonovadmin    false    219   ��       �          0    66839    sonovsite_galery_content 
   TABLE DATA               D   COPY sonovsite_galery_content (id, galery_id, image_id) FROM stdin;
    public    
   sonovadmin    false    229   ��       �           0    0    sonovsite_galery_content_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('sonovsite_galery_content_id_seq', 1, false);
            public    
   sonovadmin    false    228            �           0    0    sonovsite_galery_uid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('sonovsite_galery_uid_seq', 1, false);
            public    
   sonovadmin    false    218            �          0    66801    sonovsite_image 
   TABLE DATA               Z   COPY sonovsite_image (uid, title, thumbnail, full_img, external_link, legend) FROM stdin;
    public    
   sonovadmin    false    221   �       �           0    0    sonovsite_image_uid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('sonovsite_image_uid_seq', 1, true);
            public    
   sonovadmin    false    220            �          0    66812    sonovsite_son 
   TABLE DATA               �   COPY sonovsite_son (uid, title, thumbnail, start_video_at, created_date, short_desc, source_site, source_id_string, posted_by_id, is_visible, modified_date) FROM stdin;
    public    
   sonovadmin    false    223   h�       �          0    66831    sonovsite_son_tags 
   TABLE DATA               9   COPY sonovsite_son_tags (id, son_id, tag_id) FROM stdin;
    public    
   sonovadmin    false    227    �       �           0    0    sonovsite_son_tags_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('sonovsite_son_tags_id_seq', 9, true);
            public    
   sonovadmin    false    226            �           0    0    sonovsite_son_uid_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('sonovsite_son_uid_seq', 6, true);
            public    
   sonovadmin    false    222            �          0    66823    sonovsite_tag 
   TABLE DATA               ,   COPY sonovsite_tag (uid, title) FROM stdin;
    public    
   sonovadmin    false    225   _�       �           0    0    sonovsite_tag_uid_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('sonovsite_tag_uid_seq', 8, true);
            public    
   sonovadmin    false    224            �          0    65429    spatial_ref_sys 
   TABLE DATA               "   COPY spatial_ref_sys  FROM stdin;
    public       postgres    false    183   ��       �           2606    66652    auth_group_name_key 
   CONSTRAINT     R   ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public      
   sonovadmin    false    204    204            �           2606    66707 -   auth_group_permissions_group_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 n   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq;
       public      
   sonovadmin    false    206    206    206            �           2606    66660    auth_group_permissions_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public      
   sonovadmin    false    206    206            �           2606    66650    auth_group_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public      
   sonovadmin    false    204    204            �           2606    66693 -   auth_permission_content_type_id_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);
 g   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_01ab375a_uniq;
       public      
   sonovadmin    false    202    202    202            �           2606    66642    auth_permission_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public      
   sonovadmin    false    202    202            �           2606    66678    auth_user_groups_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public      
   sonovadmin    false    210    210            �           2606    66722 &   auth_user_groups_user_id_94350c0c_uniq 
   CONSTRAINT     x   ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);
 a   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_94350c0c_uniq;
       public      
   sonovadmin    false    210    210    210            �           2606    66668    auth_user_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public      
   sonovadmin    false    208    208            �           2606    66686    auth_user_user_permissions_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public      
   sonovadmin    false    212    212            �           2606    66736 0   auth_user_user_permissions_user_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 u   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq;
       public      
   sonovadmin    false    212    212    212            �           2606    66765    auth_user_username_key 
   CONSTRAINT     X   ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public      
   sonovadmin    false    208    208            �           2606    66750    django_admin_log_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public      
   sonovadmin    false    214    214            �           2606    66634 +   django_content_type_app_label_76bd3d3b_uniq 
   CONSTRAINT        ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);
 i   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_76bd3d3b_uniq;
       public      
   sonovadmin    false    200    200    200            �           2606    66632    django_content_type_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public      
   sonovadmin    false    200    200            �           2606    66624    django_migrations_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public      
   sonovadmin    false    198    198            �           2606    66777    django_session_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public      
   sonovadmin    false    215    215            �           2606    66790    sonovsite_article_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY sonovsite_article
    ADD CONSTRAINT sonovsite_article_pkey PRIMARY KEY (uid);
 R   ALTER TABLE ONLY public.sonovsite_article DROP CONSTRAINT sonovsite_article_pkey;
       public      
   sonovadmin    false    217    217            �           2606    66894 /   sonovsite_article_tags_article_id_d01e43ff_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY sonovsite_article_tags
    ADD CONSTRAINT sonovsite_article_tags_article_id_d01e43ff_uniq UNIQUE (article_id, tag_id);
 p   ALTER TABLE ONLY public.sonovsite_article_tags DROP CONSTRAINT sonovsite_article_tags_article_id_d01e43ff_uniq;
       public      
   sonovadmin    false    231    231    231            �           2606    66852    sonovsite_article_tags_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY sonovsite_article_tags
    ADD CONSTRAINT sonovsite_article_tags_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.sonovsite_article_tags DROP CONSTRAINT sonovsite_article_tags_pkey;
       public      
   sonovadmin    false    231    231            �           2606    66880 0   sonovsite_galery_content_galery_id_4f030636_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY sonovsite_galery_content
    ADD CONSTRAINT sonovsite_galery_content_galery_id_4f030636_uniq UNIQUE (galery_id, image_id);
 s   ALTER TABLE ONLY public.sonovsite_galery_content DROP CONSTRAINT sonovsite_galery_content_galery_id_4f030636_uniq;
       public      
   sonovadmin    false    229    229    229            �           2606    66844    sonovsite_galery_content_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY sonovsite_galery_content
    ADD CONSTRAINT sonovsite_galery_content_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.sonovsite_galery_content DROP CONSTRAINT sonovsite_galery_content_pkey;
       public      
   sonovadmin    false    229    229            �           2606    66798    sonovsite_galery_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY sonovsite_galery
    ADD CONSTRAINT sonovsite_galery_pkey PRIMARY KEY (uid);
 P   ALTER TABLE ONLY public.sonovsite_galery DROP CONSTRAINT sonovsite_galery_pkey;
       public      
   sonovadmin    false    219    219            �           2606    66809    sonovsite_image_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY sonovsite_image
    ADD CONSTRAINT sonovsite_image_pkey PRIMARY KEY (uid);
 N   ALTER TABLE ONLY public.sonovsite_image DROP CONSTRAINT sonovsite_image_pkey;
       public      
   sonovadmin    false    221    221            �           2606    66820    sonovsite_son_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY sonovsite_son
    ADD CONSTRAINT sonovsite_son_pkey PRIMARY KEY (uid);
 J   ALTER TABLE ONLY public.sonovsite_son DROP CONSTRAINT sonovsite_son_pkey;
       public      
   sonovadmin    false    223    223            �           2606    66836    sonovsite_son_tags_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY sonovsite_son_tags
    ADD CONSTRAINT sonovsite_son_tags_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.sonovsite_son_tags DROP CONSTRAINT sonovsite_son_tags_pkey;
       public      
   sonovadmin    false    227    227            �           2606    66866 '   sonovsite_son_tags_son_id_f028c633_uniq 
   CONSTRAINT     x   ALTER TABLE ONLY sonovsite_son_tags
    ADD CONSTRAINT sonovsite_son_tags_son_id_f028c633_uniq UNIQUE (son_id, tag_id);
 d   ALTER TABLE ONLY public.sonovsite_son_tags DROP CONSTRAINT sonovsite_son_tags_son_id_f028c633_uniq;
       public      
   sonovadmin    false    227    227    227            �           2606    66828    sonovsite_tag_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY sonovsite_tag
    ADD CONSTRAINT sonovsite_tag_pkey PRIMARY KEY (uid);
 J   ALTER TABLE ONLY public.sonovsite_tag DROP CONSTRAINT sonovsite_tag_pkey;
       public      
   sonovadmin    false    225    225            �           1259    66695    auth_group_name_a6ea08ec_like    INDEX     a   CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public      
   sonovadmin    false    204            �           1259    66708    auth_group_permissions_0e939a4f    INDEX     _   CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);
 3   DROP INDEX public.auth_group_permissions_0e939a4f;
       public      
   sonovadmin    false    206            �           1259    66709    auth_group_permissions_8373b171    INDEX     d   CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);
 3   DROP INDEX public.auth_group_permissions_8373b171;
       public      
   sonovadmin    false    206            �           1259    66694    auth_permission_417f1b1c    INDEX     X   CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);
 ,   DROP INDEX public.auth_permission_417f1b1c;
       public      
   sonovadmin    false    202            �           1259    66724    auth_user_groups_0e939a4f    INDEX     S   CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);
 -   DROP INDEX public.auth_user_groups_0e939a4f;
       public      
   sonovadmin    false    210            �           1259    66723    auth_user_groups_e8701ad4    INDEX     R   CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);
 -   DROP INDEX public.auth_user_groups_e8701ad4;
       public      
   sonovadmin    false    210            �           1259    66738 #   auth_user_user_permissions_8373b171    INDEX     l   CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);
 7   DROP INDEX public.auth_user_user_permissions_8373b171;
       public      
   sonovadmin    false    212            �           1259    66737 #   auth_user_user_permissions_e8701ad4    INDEX     f   CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);
 7   DROP INDEX public.auth_user_user_permissions_e8701ad4;
       public      
   sonovadmin    false    212            �           1259    66766     auth_user_username_6821ab7c_like    INDEX     g   CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public      
   sonovadmin    false    208            �           1259    66761    django_admin_log_417f1b1c    INDEX     Z   CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);
 -   DROP INDEX public.django_admin_log_417f1b1c;
       public      
   sonovadmin    false    214            �           1259    66762    django_admin_log_e8701ad4    INDEX     R   CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);
 -   DROP INDEX public.django_admin_log_e8701ad4;
       public      
   sonovadmin    false    214            �           1259    66778    django_session_de54fa62    INDEX     R   CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);
 +   DROP INDEX public.django_session_de54fa62;
       public      
   sonovadmin    false    215            �           1259    66779 (   django_session_session_key_c0390e0f_like    INDEX     w   CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public      
   sonovadmin    false    215            �           1259    66853    sonovsite_article_2dbcba41    INDEX     Q   CREATE INDEX sonovsite_article_2dbcba41 ON sonovsite_article USING btree (slug);
 .   DROP INDEX public.sonovsite_article_2dbcba41;
       public      
   sonovadmin    false    217            �           1259    66979    sonovsite_article_f855e766    INDEX     Y   CREATE INDEX sonovsite_article_f855e766 ON sonovsite_article USING btree (posted_by_id);
 .   DROP INDEX public.sonovsite_article_f855e766;
       public      
   sonovadmin    false    217            �           1259    66854 $   sonovsite_article_slug_86494b7e_like    INDEX     o   CREATE INDEX sonovsite_article_slug_86494b7e_like ON sonovsite_article USING btree (slug varchar_pattern_ops);
 8   DROP INDEX public.sonovsite_article_slug_86494b7e_like;
       public      
   sonovadmin    false    217            �           1259    66896    sonovsite_article_tags_76f094bc    INDEX     ]   CREATE INDEX sonovsite_article_tags_76f094bc ON sonovsite_article_tags USING btree (tag_id);
 3   DROP INDEX public.sonovsite_article_tags_76f094bc;
       public      
   sonovadmin    false    231            �           1259    66895    sonovsite_article_tags_a00c1b00    INDEX     a   CREATE INDEX sonovsite_article_tags_a00c1b00 ON sonovsite_article_tags USING btree (article_id);
 3   DROP INDEX public.sonovsite_article_tags_a00c1b00;
       public      
   sonovadmin    false    231            �           1259    66904    sonovsite_galery_2dbcba41    INDEX     O   CREATE INDEX sonovsite_galery_2dbcba41 ON sonovsite_galery USING btree (slug);
 -   DROP INDEX public.sonovsite_galery_2dbcba41;
       public      
   sonovadmin    false    219            �           1259    66881 !   sonovsite_galery_content_7c4e1119    INDEX     d   CREATE INDEX sonovsite_galery_content_7c4e1119 ON sonovsite_galery_content USING btree (galery_id);
 5   DROP INDEX public.sonovsite_galery_content_7c4e1119;
       public      
   sonovadmin    false    229            �           1259    66882 !   sonovsite_galery_content_f33175e6    INDEX     c   CREATE INDEX sonovsite_galery_content_f33175e6 ON sonovsite_galery_content USING btree (image_id);
 5   DROP INDEX public.sonovsite_galery_content_f33175e6;
       public      
   sonovadmin    false    229            �           1259    66985    sonovsite_galery_f855e766    INDEX     W   CREATE INDEX sonovsite_galery_f855e766 ON sonovsite_galery USING btree (posted_by_id);
 -   DROP INDEX public.sonovsite_galery_f855e766;
       public      
   sonovadmin    false    219            �           1259    66905 #   sonovsite_galery_slug_b9260a4a_like    INDEX     m   CREATE INDEX sonovsite_galery_slug_b9260a4a_like ON sonovsite_galery USING btree (slug varchar_pattern_ops);
 7   DROP INDEX public.sonovsite_galery_slug_b9260a4a_like;
       public      
   sonovadmin    false    219            �           1259    66991    sonovsite_son_f855e766    INDEX     Q   CREATE INDEX sonovsite_son_f855e766 ON sonovsite_son USING btree (posted_by_id);
 *   DROP INDEX public.sonovsite_son_f855e766;
       public      
   sonovadmin    false    223            �           1259    66868    sonovsite_son_tags_76f094bc    INDEX     U   CREATE INDEX sonovsite_son_tags_76f094bc ON sonovsite_son_tags USING btree (tag_id);
 /   DROP INDEX public.sonovsite_son_tags_76f094bc;
       public      
   sonovadmin    false    227            �           1259    66867    sonovsite_son_tags_7eae4e12    INDEX     U   CREATE INDEX sonovsite_son_tags_7eae4e12 ON sonovsite_son_tags USING btree (son_id);
 /   DROP INDEX public.sonovsite_son_tags_7eae4e12;
       public      
   sonovadmin    false    227            �           2606    66701 ?   auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id    FK CONSTRAINT     �   ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id;
       public    
   sonovadmin    false    3501    206    202            �           2606    66696 9   auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public    
   sonovadmin    false    206    204    3506            �           2606    66687 ?   auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id    FK CONSTRAINT     �   ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id;
       public    
   sonovadmin    false    202    3496    200            �           2606    66716 3   auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public    
   sonovadmin    false    210    3506    204            �           2606    66711 1   auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public    
   sonovadmin    false    208    3514    210            �           2606    66730 ?   auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id    FK CONSTRAINT     �   ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id;
       public    
   sonovadmin    false    212    202    3501            �           2606    66725 ;   auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public    
   sonovadmin    false    208    3514    212            �           2606    66751 ?   django_admin_content_type_id_c4bce8eb_fk_django_content_type_id    FK CONSTRAINT     �   ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id;
       public    
   sonovadmin    false    200    214    3496            �           2606    66756 1   django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public    
   sonovadmin    false    3514    214    208                       2606    66883 ?   sonovsite_article__article_id_914746b9_fk_sonovsite_article_uid    FK CONSTRAINT     �   ALTER TABLE ONLY sonovsite_article_tags
    ADD CONSTRAINT sonovsite_article__article_id_914746b9_fk_sonovsite_article_uid FOREIGN KEY (article_id) REFERENCES sonovsite_article(uid) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.sonovsite_article_tags DROP CONSTRAINT sonovsite_article__article_id_914746b9_fk_sonovsite_article_uid;
       public    
   sonovadmin    false    3541    217    231            �           2606    66980 7   sonovsite_article_posted_by_id_04b1b430_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY sonovsite_article
    ADD CONSTRAINT sonovsite_article_posted_by_id_04b1b430_fk_auth_user_id FOREIGN KEY (posted_by_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.sonovsite_article DROP CONSTRAINT sonovsite_article_posted_by_id_04b1b430_fk_auth_user_id;
       public    
   sonovadmin    false    217    208    3514                       2606    66888 ;   sonovsite_article_tags_tag_id_81d0d837_fk_sonovsite_tag_uid    FK CONSTRAINT     �   ALTER TABLE ONLY sonovsite_article_tags
    ADD CONSTRAINT sonovsite_article_tags_tag_id_81d0d837_fk_sonovsite_tag_uid FOREIGN KEY (tag_id) REFERENCES sonovsite_tag(uid) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.sonovsite_article_tags DROP CONSTRAINT sonovsite_article_tags_tag_id_81d0d837_fk_sonovsite_tag_uid;
       public    
   sonovadmin    false    231    225    3554                       2606    66869 ?   sonovsite_galery_con_galery_id_227a73af_fk_sonovsite_galery_uid    FK CONSTRAINT     �   ALTER TABLE ONLY sonovsite_galery_content
    ADD CONSTRAINT sonovsite_galery_con_galery_id_227a73af_fk_sonovsite_galery_uid FOREIGN KEY (galery_id) REFERENCES sonovsite_galery(uid) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.sonovsite_galery_content DROP CONSTRAINT sonovsite_galery_con_galery_id_227a73af_fk_sonovsite_galery_uid;
       public    
   sonovadmin    false    219    229    3546                       2606    66874 ?   sonovsite_galery_conte_image_id_c9c2aa3c_fk_sonovsite_image_uid    FK CONSTRAINT     �   ALTER TABLE ONLY sonovsite_galery_content
    ADD CONSTRAINT sonovsite_galery_conte_image_id_c9c2aa3c_fk_sonovsite_image_uid FOREIGN KEY (image_id) REFERENCES sonovsite_image(uid) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.sonovsite_galery_content DROP CONSTRAINT sonovsite_galery_conte_image_id_c9c2aa3c_fk_sonovsite_image_uid;
       public    
   sonovadmin    false    221    3549    229            �           2606    66986 6   sonovsite_galery_posted_by_id_8c04ceda_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY sonovsite_galery
    ADD CONSTRAINT sonovsite_galery_posted_by_id_8c04ceda_fk_auth_user_id FOREIGN KEY (posted_by_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.sonovsite_galery DROP CONSTRAINT sonovsite_galery_posted_by_id_8c04ceda_fk_auth_user_id;
       public    
   sonovadmin    false    219    208    3514                        2606    66992 3   sonovsite_son_posted_by_id_bc690688_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY sonovsite_son
    ADD CONSTRAINT sonovsite_son_posted_by_id_bc690688_fk_auth_user_id FOREIGN KEY (posted_by_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 k   ALTER TABLE ONLY public.sonovsite_son DROP CONSTRAINT sonovsite_son_posted_by_id_bc690688_fk_auth_user_id;
       public    
   sonovadmin    false    223    3514    208                       2606    66855 7   sonovsite_son_tags_son_id_7cd356bd_fk_sonovsite_son_uid    FK CONSTRAINT     �   ALTER TABLE ONLY sonovsite_son_tags
    ADD CONSTRAINT sonovsite_son_tags_son_id_7cd356bd_fk_sonovsite_son_uid FOREIGN KEY (son_id) REFERENCES sonovsite_son(uid) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.sonovsite_son_tags DROP CONSTRAINT sonovsite_son_tags_son_id_7cd356bd_fk_sonovsite_son_uid;
       public    
   sonovadmin    false    3552    227    223                       2606    66860 7   sonovsite_son_tags_tag_id_db030f1f_fk_sonovsite_tag_uid    FK CONSTRAINT     �   ALTER TABLE ONLY sonovsite_son_tags
    ADD CONSTRAINT sonovsite_son_tags_tag_id_db030f1f_fk_sonovsite_tag_uid FOREIGN KEY (tag_id) REFERENCES sonovsite_tag(uid) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.sonovsite_son_tags DROP CONSTRAINT sonovsite_son_tags_tag_id_db030f1f_fk_sonovsite_tag_uid;
       public    
   sonovadmin    false    227    225    3554            �      x������ � �      �      x������ � �      �   `  x�]�K�� Eǰ
W���{�t���ҊZ��}�����'�5*�m��LS��sa��x%���f�&d�3�l3�o%�"p���r�o%����i��w/e�]����
�8��.����c9�e�DE��sK��؁3^ƪ2��c=EMfZK��5��\x�TQ1���޳��O+2a�ޑ��ڌo����2��79���.�I��_ 1pG��ބA�!ꖇ���HFk�K�
9D@� :�gV�>���G��UV` B���� �5Qd�kW+2a��������[��Ԕ{Z��RM�Q��U��Џ˫2��硘;W����B�?�[�*�k �ɔg?�8�������م�      �   �   x�]��
�@����St�&��ȸ(t�-�""�K��f��b�ӷ����x�뼠SWfġ��̮����&��v�uZ&�;��֛�J��3꾾�/\tf��Ár3�<<�	bS䓊�BP��3���Q5��mƬ|f`{ȣ/���f+�      �      x������ � �      �      x������ � �      �   r  x���ώ�6��ާ`��Ck�����nMrK�K��]�-Ò�,��E���c�y�-�M�Y�� >,����H~��F �K+J�ʤR'ʣ���T#5zQ��Yو��b��n��h�M�U�'���O�Y��e*>}��v�G�vT�%SP���Y8E��t�-�{�˫����|s�κ��EVV�ooqᐉ.!$�'}��p�z��{��Y��,q(��,�Y>�2QN��C�L��2U6!���,��"H�iI����Y*�8�}c��Y�J����_C%�ad)	��b�NQ&�Tjp�nzp ���3�<��%���K�%Z��ʹ�Eٮ�}�|���e-��E�Uu��H6^r�ԑ&�Q�����i��k=�"�^�4�^��5u���2�4��\\o3M̄!A�ȘG1g����E3ݦ٘�?�� �Q�6c��2/�I�nw�O��=L�A�b�]�C���p`�N�����0��?UBF��t�EU/���9�: ¡f��A�^��T`_�ˋ�ʸSM�)�[>3���)��N
>�::�q�4�1V����Շ���loD�ۛ_D�d.���ϰ��Yu��bڵeq�9�m��k�J�3�m(O�l�7��ϲE�g|��U.��K0�.AJlV+moV����"��+��������1�3LI�Ir��{�lV�,���?���eݔm&��]�6G��`�*���vI�͉Ҽa����Ц�@��Q|h-���D�g�l�wx���>����?��D��N�
�U�}%�Ɣ���]GD�^-�m�F�`�wE�&�X#T�D�{����� ~�(h��f��cV7��/���رG��_nD��MgeU�������s�
��説�ٍ��˦-V�V��<� �i��x�}�{�x_�������x�sG��	��5�����89TQl���H�\�>�M謋��*��J��f0�nT96�֠�`�3΅S"�� :������=�\����$g�[A@�nQ���6FPxMp�_�;\	�6oľ;5@�tJ��ƿ�S��ڷ�̓��:�F%�KeBQ7Z7]���8�}H�~�.�P�>l�,B��%��%7�ܨ��U&�n^~�gUrڵ���*x��>te�w��|W[�eA'8I ��5Σl�)����hH&db��B�Uy8��&�GI��6�A\����[;��>�� N��CA�� �~,�HQ�r��KyD����;؞�!:����v0/�]�S0<ۄx|h�6
+���5u���|��c��砲�͢u���� �%v�[�+�K�Y���67�`\��}�n��v��@�uN����=���g>K���sK�\�3w�j�W�s���9m(_:���S���5�����?���E      �   |   x�M��
1��u�È�	c���hRa�~���ݟq��2��%[[q"�����p޻JKA5���.��^q��d3[��|�F*���wҒ�W�	��^��s���97K�ㄣ������0E6      �   �  x����n�0���5H-��,�D��ZN0}�JJƉR|���P?El~O��e�:��  �n���T�?P�!X�Vbk4�ʼX�/˟�
ނ&��7�8t�~���%�Q�\?�R���0]�K?9<n� )��	�?����/n�Cؤ��
E둙��fw����Mc�w����0�ү�(�9fJ��S��a�]��(�ˊ^��Gig:/q� dF�L����D�����.���H2��]@XJ�~^�yM���rf�	��	⊨{+W�wG�Ls̃va���!F
�9�1ȋ���z3����V�K�țʌw���FIyo@4q�k얰W'Ӗ��[���c�����}�/��-gd�'UnR]�oK����tH�*�,'��2P�u!TM���y%��&])��'�5!_	P�X�Z J���U90�zc��\�e��665�^L���4
Pt�B�+ք�����A���V�ET���=�n�m�      �   
  x�]�Mo�0 ����/��UК�$�J,�Q��>Z��S��[�d�ݟ����4���_���,x�E_͹�� 	� ��+y�2]#�oF*��H3��,L�R����:%"�V���i��ϲQ�QU��X��G��Hn�L6����M	�o��M���IAZ��1��v��*�g�.!r�է�����K�@�����H�������v������{a=�(q_K(�zD���b�f �VV@�@��'���q�o.f      �   L  x��V�r�F}�����Z�$(QZR-�r*v�
KR�j7�r�!0�`�b�(��<�����������@�KO��ӧg:�*
�#�Z���F���)FY��l機�ګ�_A+�(�"P���,�2JiZ��)	�߹w&��R��U�W��~����O�qms�
Ko���<٘K��|MN�Zf�ֶqdk�h}���A�{arߘ���t�6G݈�8CB������e/+���OݠK�4,-�2����Mm��w!�.�Ȕ��/>�D�
O�3�(�b��%��&ϥ�kb�Dl%��8�Ф����M8�\��J9�i��"���v���[k���s��>UVy����Z�Ͽ>�e�z#��ִ,U]{q�[��7{��pζ��AJS���Kv�r˳Z�K8�k���h&�D���-���8�[����ɐ�2�s��N���Gwp��]d�m�2t�yQI� �!-���<Ff8�I�b)�����s�H3��1��7�f��7�y4S�!"\�N
�p@�2>�B��T�x '4�Tр�$*�3�w��P! EN�k�2P��:��k)����Jί���a5�A��#��ljI9�Q6ɀWB6+lT}��ɁL����~r,�5��Dn�~1Y,����C]�`:I�F��QrH�����|�|7I�d�0>L���n6y�?�#�<���τ	~pL/��?�֏����L�*�Y4;�D U޳h?�E�]v�!�~>�mo
 ��e��|�����ʓv��u�R�tg�Lۮ�}�4����s��RP�,�F�xĴ�fX��Dx�`D�J�#���c#}���w�j��ll�����;FH����drD隮׬6��hr@�b�>�KH�^c�E)@���w\N1��z	�Nj&F��8�\��@wp�U ����Oz+~�����C���@\��3�0�$�D�3ݲd��Kk����y|:~�i}���d��M �)(�r��z9�k�>��~a@B���㘾���NK�[;���5T�®-�Kn(W�Eh��=`�Ad�Z���ӅE�2���%��d�Wh���I��5��O�1�b�7���o9�(SS�g�~eN���vQ�`�C���t�"ޟw?�Cc�T*G�a�T��[�-��zJ�L�"7�N|��B���;��mD��@����!}1�8�"��ɫ������]���
:�(;ފ5�?�C�+TU��8�Q)��d;ir�-��_j�݃:`g_Q�[u�웫kP~��Ar
�nT�h�������:�1�'�P�П��Rh)��U�8�!ݾZ\�X2Y��}m��ը���5�`�B�*��������T�eWr_���,��NO�h�7��nX�>Yt�W[�����#\$�1���͘>�AJ`��O��v�4��I�D����Z�ukF�S�B�)XD'��ÅťB������n���I���^��O���D!��=�����4>�Jru=`N��I��bC�yw�y���Z���I���+����z?G.4nBI�@��M����|�$�'��Ņ���\�+ +�Mn;����Wn���Gq3��̧�_��cJf��t>M��$�̎��.~����;       �   ,   x�3�4�4�2�F\�@Ҙ�H�pYrs�q )s�=... oH*      �      x������ � �      �      x������ � �      �   E   x�3�,�ϋ�)��7�,.I,�L�
�g���g�&����ėd��&�%f��e�TV������ ��$�      �   �  x�m�Mn�0���)f�EG�%K֮Mݴi�� R� AK#�%�$%����k�+t�}�ԡ�&�k��ig��G^S�n��m��p�\��l<c�فQ�j���v}8g���S�p�*���F~���� �`�qN^����FX5�Bݢ��[#@w�ق7E� � �t��h������Rka�{���3��sz��f��Q}^�}������%�?�cZ�i�$QLe�ޥ�x���祺٨ݐ���c�E�|���Q@�ᝡ��PjQ�\���J��j4A[K�����������+�xaQ�i��+q��=��%!�����4�(N����{����y�sNU*�Ìk��:�%L,�%���:�N�p����ެnU���d\VH����Z2�9�6�D�L�O9S��Ӯ�J��̑�����R�.�u>�:���i�iL#yo�\�މ�4n����2�ษV��y/a��0�@V:[�`�OF������a���~e���)�oxFL�[)��L�ޥ�e��Ѣy�n���<���I�� �F�П��S�9��U�b<��Q���T��Ӹ��}�1�̉Z&9s"��?�3VHm~���.M�y����<�݂sA�]Iz)�,c���
AH�h�m>Sgs��\l���7En��$'���: ���      �   /   x���  ��w<�-���Ad��B�W��H�l�����������      �   W   x�E�;� �z�]ք�{$$�.��7VV�1�6ȇ`!S��r�%���GD0S�V��V�ҙ�Ƈcj����F�wv���} �HW^      �      x������ � �     