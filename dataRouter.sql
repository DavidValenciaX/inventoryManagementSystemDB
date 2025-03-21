toc.dat                                                                                             0000600 0004000 0002000 00000020251 14766703202 0014446 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP   .                    }            inventorymanagementsystemdb    15.8    16.4 "    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         �           1262    86144    inventorymanagementsystemdb    DATABASE     �   CREATE DATABASE inventorymanagementsystemdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
 +   DROP DATABASE inventorymanagementsystemdb;
                postgres    false         �          0    86252    status_categories 
   TABLE DATA           Z   COPY public.status_categories (id, name, description, created_at, updated_at) FROM stdin;
    public          postgres    false    215       3483.dat �          0    86262    status_types 
   TABLE DATA           b   COPY public.status_types (id, name, category_id, description, created_at, updated_at) FROM stdin;
    public          postgres    false    217       3485.dat �          0    86277    users 
   TABLE DATA             COPY public.users (id, full_name, password_hash, email, phone, company_name, confirmation_token_hash, confirmation_token_expiration, password_reset_token_hash, password_reset_token_expiration, status_id, profile_image_url, created_at, updated_at) FROM stdin;
    public          postgres    false    219       3487.dat �          0    86333 
   categories 
   TABLE DATA           O   COPY public.categories (id, name, user_id, created_at, updated_at) FROM stdin;
    public          postgres    false    227       3495.dat �          0    86294 	   customers 
   TABLE DATA           e   COPY public.customers (id, name, email, phone, address, created_at, updated_at, user_id) FROM stdin;
    public          postgres    false    221       3489.dat �          0    86306    measurement_types 
   TABLE DATA           Z   COPY public.measurement_types (id, name, description, created_at, updated_at) FROM stdin;
    public          postgres    false    223       3491.dat �          0    86348 	   suppliers 
   TABLE DATA           l   COPY public.suppliers (id, name, email, phone, address, notes, created_at, updated_at, user_id) FROM stdin;
    public          postgres    false    229       3497.dat �          0    86316    units_of_measure 
   TABLE DATA           i   COPY public.units_of_measure (id, name, symbol, measurement_type_id, created_at, updated_at) FROM stdin;
    public          postgres    false    225       3493.dat �          0    86360    products 
   TABLE DATA           �   COPY public.products (id, name, description, unit_price, unit_cost, supplier_id, image_url, category_id, unit_of_measure_id, created_at, updated_at, user_id) FROM stdin;
    public          postgres    false    231       3499.dat �          0    86432    purchase_orders 
   TABLE DATA           �   COPY public.purchase_orders (id, supplier_id, status_id, subtotal, total_amount, purchase_order_date, created_at, updated_at) FROM stdin;
    public          postgres    false    237       3505.dat �          0    86453    purchase_order_products 
   TABLE DATA           �   COPY public.purchase_order_products (id, purchase_order_id, product_id, quantity, unit_price, returned_quantity, return_reason, return_date, created_at, updated_at) FROM stdin;
    public          postgres    false    239       3507.dat �          0    86385    sales_orders 
   TABLE DATA           ~   COPY public.sales_orders (id, customer_id, status_id, subtotal, total_amount, order_date, created_at, updated_at) FROM stdin;
    public          postgres    false    233       3501.dat �          0    86406    sales_order_products 
   TABLE DATA           �   COPY public.sales_order_products (id, sales_order_id, product_id, quantity, unit_price, returned_quantity, return_reason, return_date, created_at, updated_at) FROM stdin;
    public          postgres    false    235       3503.dat �          0    86479    transaction_types 
   TABLE DATA           Z   COPY public.transaction_types (id, name, description, created_at, updated_at) FROM stdin;
    public          postgres    false    241       3509.dat �          0    86489    inventory_transactions 
   TABLE DATA           �   COPY public.inventory_transactions (id, product_id, quantity, transaction_type_id, sales_order_product_id, purchase_order_product_id, previous_stock, new_stock, created_at, updated_at) FROM stdin;
    public          postgres    false    243       3511.dat �           0    0    categories_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.categories_id_seq', 6, true);
          public          postgres    false    226         �           0    0    customers_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.customers_id_seq', 1, false);
          public          postgres    false    220         �           0    0    inventory_transactions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.inventory_transactions_id_seq', 1, false);
          public          postgres    false    242         �           0    0    measurement_types_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.measurement_types_id_seq', 5, true);
          public          postgres    false    222         �           0    0    products_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.products_id_seq', 8, true);
          public          postgres    false    230         �           0    0    purchase_order_products_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.purchase_order_products_id_seq', 1, false);
          public          postgres    false    238         �           0    0    purchase_orders_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.purchase_orders_id_seq', 1, false);
          public          postgres    false    236         �           0    0    sales_order_products_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.sales_order_products_id_seq', 1, false);
          public          postgres    false    234         �           0    0    sales_orders_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.sales_orders_id_seq', 1, false);
          public          postgres    false    232         �           0    0    status_categories_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.status_categories_id_seq', 5, true);
          public          postgres    false    214         �           0    0    status_types_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.status_types_id_seq', 27, true);
          public          postgres    false    216         �           0    0    suppliers_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.suppliers_id_seq', 4, true);
          public          postgres    false    228         �           0    0    transaction_types_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.transaction_types_id_seq', 11, true);
          public          postgres    false    240         �           0    0    units_of_measure_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.units_of_measure_id_seq', 13, true);
          public          postgres    false    224         �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 2, true);
          public          postgres    false    218                                                                                                                                                                                                                                                                                                                                                               3483.dat                                                                                            0000600 0004000 0002000 00000000755 14766703202 0014271 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	sales_order	Estados de órdenes de venta	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
2	purchase_order	Estados de órdenes de compra	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
3	purchase_order_product	Estados de productos en órdenes de compra	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
4	return	Estados de devoluciones	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
5	user	Estados de usuarios	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
\.


                   3485.dat                                                                                            0000600 0004000 0002000 00000004707 14766703202 0014274 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	pending	1	Orden recibida	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
2	processing	1	En preparación	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
3	shipped	1	Enviado	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
4	delivered	1	Entregado	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
5	cancelled	1	Cancelado	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
6	draft	2	Orden en borrador	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
7	ordered	2	Orden realizada	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
8	partial	2	Orden parcialmente entregada	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
9	delivered	2	Orden entregada	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
10	cancelled	2	Orden cancelada	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
11	Return Requested	4	Devolución solicitada	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
12	Return Pending	4	Devolución pendiente	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
13	Return Processing	4	Devolución en proceso	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
14	Return Approved	4	Devolución aprobada	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
15	Return Completed	4	Devolución completada	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
16	Partial Return	4	Devolución parcial	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
17	Return Rejected	4	Devolución rechazada	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
18	Return Received	4	Devolución recibida	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
19	Return Quarantined	4	Devolución en cuarentena	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
20	Return Restocked	4	Devolución reintegrada al inventario	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
21	Return Discarded	4	Producto descartado por problemas de calidad	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
22	Return Sent	4	Devolución enviada	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
23	active	5	Usuario activo	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
24	inactive	5	Usuario inactivo	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
25	suspended	5	Usuario suspendido	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
26	pending_confirmation	5	Usuario pendiente de confirmación	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
27	locked	5	Usuario bloqueado por seguridad	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
\.


                                                         3487.dat                                                                                            0000600 0004000 0002000 00000000571 14766703202 0014271 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Juan Pérez	$2b$10$LAf5uqgmNTdHsajRlG5VkOgEaUl6YrMpP4vXHVuzc//mSUycW8Wda	juan@correo.com	3156789123	Empresa XYZ	\N	\N	\N	\N	23	\N	2025-03-18 19:47:50.225953	2025-03-18 19:51:56.18889
2	Juan Pérez	$2b$10$EH4sOJVyXwZ3AW4rzMI0du3mXNFYD5to4.FKK/c/kGmcB7HO96s9m	juan2@correo.com	3156789123	Empresa XYZ	\N	\N	\N	\N	23	\N	2025-03-18 20:24:25.548456	2025-03-18 20:30:40.924394
\.


                                                                                                                                       3495.dat                                                                                            0000600 0004000 0002000 00000000555 14766703202 0014272 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Zapatos	1	2025-03-18 20:20:24.265771	2025-03-18 20:20:24.265771
2	Ropa inferior	1	2025-03-18 20:21:11.218103	2025-03-18 20:21:11.218103
3	Almacenario	1	2025-03-18 20:22:04.123385	2025-03-18 20:22:04.123385
5	Calzado por juan 2	2	2025-03-18 20:31:32.33371	2025-03-18 20:31:32.33371
6	Calzado por juan 3	2	2025-03-18 20:52:18.751726	2025-03-18 20:52:18.751726
\.


                                                                                                                                                   3489.dat                                                                                            0000600 0004000 0002000 00000000005 14766703202 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3491.dat                                                                                            0000600 0004000 0002000 00000000772 14766703202 0014267 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Length	Units for measuring distances and dimensions	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
2	Weight	Units for measuring mass	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
3	Volume	Units for measuring volume of liquids or solids	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
4	Area	Units for measuring surface area	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
5	Temperature	Units for measuring temperature	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
\.


      3497.dat                                                                                            0000600 0004000 0002000 00000000634 14766703202 0014272 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Proveedor ABC	contacto@abc.com	3001234567	Calle 123 #45-67	Notas adicionales	2025-03-18 21:41:15.664186	2025-03-18 21:41:15.664186	2
2	Proveedor AbC	contacto2@abc.com	3001234567	Calle 123 #45-67	Notas adicionales	2025-03-18 21:41:41.795975	2025-03-18 21:41:41.795975	2
4	Proveedor Abc	contacto4@abc.com	3001234567	Calle 123 #45-67	Notas adicionales	2025-03-18 21:51:19.686924	2025-03-18 21:51:19.686924	1
\.


                                                                                                    3493.dat                                                                                            0000600 0004000 0002000 00000001621 14766703202 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Meter	m	1	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
2	Centimeter	cm	1	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
3	Millimeter	mm	1	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
4	Inch	in	1	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
5	Foot	ft	1	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
6	Kilogram	kg	2	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
7	Gram	g	2	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
8	Pound	lb	2	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
9	Ounce	oz	2	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
10	Liter	L	3	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
11	Milliliter	mL	3	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
12	Gallon (US)	gal	3	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
13	Fluid Ounce (US)	fl oz	3	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
\.


                                                                                                               3499.dat                                                                                            0000600 0004000 0002000 00000001140 14766703202 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        4	producto x actualizado 2	Nueva descripción	110.00	90.00	1	http://ejemplo.com/nueva_imagen.jpg	5	1	2025-03-18 23:45:16.406434	2025-03-18 23:47:29.494362	2
6	producto 4	Descripción del producto X	100.50	80.00	2	http://ejemplo.com/imagen.jpg	5	1	2025-03-18 23:47:59.918222	2025-03-18 23:47:59.918222	2
7	producto 5	Descripción del producto X	100.50	80.00	2	http://ejemplo.com/imagen.jpg	5	1	2025-03-18 23:48:04.271505	2025-03-18 23:48:04.271505	2
8	producto usuario 1	Descripción del producto X	100.50	80.00	4	http://ejemplo.com/imagen.jpg	3	1	2025-03-18 23:49:08.177281	2025-03-18 23:49:08.177281	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                3505.dat                                                                                            0000600 0004000 0002000 00000000005 14766703202 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3507.dat                                                                                            0000600 0004000 0002000 00000000005 14766703202 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3501.dat                                                                                            0000600 0004000 0002000 00000000005 14766703202 0014244 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3503.dat                                                                                            0000600 0004000 0002000 00000000005 14766703202 0014246 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3509.dat                                                                                            0000600 0004000 0002000 00000002221 14766703202 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	purchase	Ingreso de inventario por compra a proveedores	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
2	sale	Salida de inventario por venta a clientes	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
3	adjustment	Ajuste manual de inventario	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
4	return	Devolución de productos	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
5	donation	Donación de productos	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
6	loss	Pérdida de productos	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
7	Sale Return	Ajuste de inventario por devolución de orden de venta	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
8	Purchase Return	Ajuste de inventario por devolución a proveedor	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
9	Return Received	Productos devueltos recibidos en cuarentena	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
10	Return Restocked	Productos aprobados y reintegrados al inventario	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
11	Return Discarded	Productos descartados definitivamente	2025-03-18 19:47:06.710975	2025-03-18 19:47:06.710975
\.


                                                                                                                                                                                                                                                                                                                                                                               3511.dat                                                                                            0000600 0004000 0002000 00000000005 14766703202 0014245 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           restore.sql                                                                                         0000600 0004000 0002000 00000022303 14766703202 0015373 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8
-- Dumped by pg_dump version 16.4

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

DROP DATABASE inventorymanagementsystemdb;
--
-- Name: inventorymanagementsystemdb; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE inventorymanagementsystemdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';


ALTER DATABASE inventorymanagementsystemdb OWNER TO postgres;

\connect inventorymanagementsystemdb

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
-- Data for Name: status_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status_categories (id, name, description, created_at, updated_at) FROM stdin;
\.
COPY public.status_categories (id, name, description, created_at, updated_at) FROM '$$PATH$$/3483.dat';

--
-- Data for Name: status_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status_types (id, name, category_id, description, created_at, updated_at) FROM stdin;
\.
COPY public.status_types (id, name, category_id, description, created_at, updated_at) FROM '$$PATH$$/3485.dat';

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, full_name, password_hash, email, phone, company_name, confirmation_token_hash, confirmation_token_expiration, password_reset_token_hash, password_reset_token_expiration, status_id, profile_image_url, created_at, updated_at) FROM stdin;
\.
COPY public.users (id, full_name, password_hash, email, phone, company_name, confirmation_token_hash, confirmation_token_expiration, password_reset_token_hash, password_reset_token_expiration, status_id, profile_image_url, created_at, updated_at) FROM '$$PATH$$/3487.dat';

--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, user_id, created_at, updated_at) FROM stdin;
\.
COPY public.categories (id, name, user_id, created_at, updated_at) FROM '$$PATH$$/3495.dat';

--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, name, email, phone, address, created_at, updated_at, user_id) FROM stdin;
\.
COPY public.customers (id, name, email, phone, address, created_at, updated_at, user_id) FROM '$$PATH$$/3489.dat';

--
-- Data for Name: measurement_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.measurement_types (id, name, description, created_at, updated_at) FROM stdin;
\.
COPY public.measurement_types (id, name, description, created_at, updated_at) FROM '$$PATH$$/3491.dat';

--
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suppliers (id, name, email, phone, address, notes, created_at, updated_at, user_id) FROM stdin;
\.
COPY public.suppliers (id, name, email, phone, address, notes, created_at, updated_at, user_id) FROM '$$PATH$$/3497.dat';

--
-- Data for Name: units_of_measure; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.units_of_measure (id, name, symbol, measurement_type_id, created_at, updated_at) FROM stdin;
\.
COPY public.units_of_measure (id, name, symbol, measurement_type_id, created_at, updated_at) FROM '$$PATH$$/3493.dat';

--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, description, unit_price, unit_cost, supplier_id, image_url, category_id, unit_of_measure_id, created_at, updated_at, user_id) FROM stdin;
\.
COPY public.products (id, name, description, unit_price, unit_cost, supplier_id, image_url, category_id, unit_of_measure_id, created_at, updated_at, user_id) FROM '$$PATH$$/3499.dat';

--
-- Data for Name: purchase_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchase_orders (id, supplier_id, status_id, subtotal, total_amount, purchase_order_date, created_at, updated_at) FROM stdin;
\.
COPY public.purchase_orders (id, supplier_id, status_id, subtotal, total_amount, purchase_order_date, created_at, updated_at) FROM '$$PATH$$/3505.dat';

--
-- Data for Name: purchase_order_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchase_order_products (id, purchase_order_id, product_id, quantity, unit_price, returned_quantity, return_reason, return_date, created_at, updated_at) FROM stdin;
\.
COPY public.purchase_order_products (id, purchase_order_id, product_id, quantity, unit_price, returned_quantity, return_reason, return_date, created_at, updated_at) FROM '$$PATH$$/3507.dat';

--
-- Data for Name: sales_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales_orders (id, customer_id, status_id, subtotal, total_amount, order_date, created_at, updated_at) FROM stdin;
\.
COPY public.sales_orders (id, customer_id, status_id, subtotal, total_amount, order_date, created_at, updated_at) FROM '$$PATH$$/3501.dat';

--
-- Data for Name: sales_order_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales_order_products (id, sales_order_id, product_id, quantity, unit_price, returned_quantity, return_reason, return_date, created_at, updated_at) FROM stdin;
\.
COPY public.sales_order_products (id, sales_order_id, product_id, quantity, unit_price, returned_quantity, return_reason, return_date, created_at, updated_at) FROM '$$PATH$$/3503.dat';

--
-- Data for Name: transaction_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaction_types (id, name, description, created_at, updated_at) FROM stdin;
\.
COPY public.transaction_types (id, name, description, created_at, updated_at) FROM '$$PATH$$/3509.dat';

--
-- Data for Name: inventory_transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory_transactions (id, product_id, quantity, transaction_type_id, sales_order_product_id, purchase_order_product_id, previous_stock, new_stock, created_at, updated_at) FROM stdin;
\.
COPY public.inventory_transactions (id, product_id, quantity, transaction_type_id, sales_order_product_id, purchase_order_product_id, previous_stock, new_stock, created_at, updated_at) FROM '$$PATH$$/3511.dat';

--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 6, true);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 1, false);


--
-- Name: inventory_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_transactions_id_seq', 1, false);


--
-- Name: measurement_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.measurement_types_id_seq', 5, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 8, true);


--
-- Name: purchase_order_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchase_order_products_id_seq', 1, false);


--
-- Name: purchase_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchase_orders_id_seq', 1, false);


--
-- Name: sales_order_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_order_products_id_seq', 1, false);


--
-- Name: sales_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_orders_id_seq', 1, false);


--
-- Name: status_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.status_categories_id_seq', 5, true);


--
-- Name: status_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.status_types_id_seq', 27, true);


--
-- Name: suppliers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suppliers_id_seq', 4, true);


--
-- Name: transaction_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_types_id_seq', 11, true);


--
-- Name: units_of_measure_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.units_of_measure_id_seq', 13, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             