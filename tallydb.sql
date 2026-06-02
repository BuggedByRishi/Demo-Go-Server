--
-- PostgreSQL database dump
--

\restrict TOeyM8lo8GAukxW7A1MNaDeCzfEzfaSbBSkm2hSQKDtClmtpIOuGFvxeYkbw9fI

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

-- Started on 2026-06-02 05:16:32

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 16943)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 5198 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 16944)
-- Name: config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.config (
    name character varying(64) NOT NULL,
    value character varying(1024)
);


ALTER TABLE public.config OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17032)
-- Name: mst_attendance_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_attendance_type (
    guid character varying(64) NOT NULL,
    name character varying(1024),
    parent character varying(1024),
    uom character varying(32),
    attendance_type character varying(64),
    attendance_period character varying(64)
);


ALTER TABLE public.mst_attendance_type OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17016)
-- Name: mst_cost_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_cost_category (
    guid character varying(64) NOT NULL,
    name character varying(1024),
    allocate_revenue smallint,
    allocate_non_revenue smallint
);


ALTER TABLE public.mst_cost_category OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17024)
-- Name: mst_cost_centre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_cost_centre (
    guid character varying(64) NOT NULL,
    name character varying(1024),
    parent character varying(1024),
    category character varying(1024)
);


ALTER TABLE public.mst_cost_centre OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 17040)
-- Name: mst_employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_employee (
    guid character varying(64) NOT NULL,
    name character varying(1024),
    parent character varying(1024),
    id_number character varying(256),
    date_of_joining date,
    date_of_release date,
    designation character varying(64),
    function_role character varying(64),
    location character varying(256),
    gender character varying(32),
    date_of_birth date,
    blood_group character varying(32),
    father_mother_name character varying(256),
    spouse_name character varying(256),
    address character varying(256),
    mobile character varying(32),
    email character varying(64),
    pan character varying(32),
    aadhar character varying(32),
    uan character varying(32),
    pf_number character varying(32),
    pf_joining_date date,
    pf_relieving_date date,
    pr_account_number character varying(32)
);


ALTER TABLE public.mst_employee OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16984)
-- Name: mst_godown; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_godown (
    guid character varying(64) NOT NULL,
    name character varying(1024),
    parent character varying(1024),
    address character varying(1024)
);


ALTER TABLE public.mst_godown OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16952)
-- Name: mst_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_group (
    guid character varying(64) NOT NULL,
    name character varying(1024),
    parent character varying(1024),
    primary_group character varying(1024),
    is_revenue smallint,
    is_deemedpositive smallint,
    is_reserved smallint,
    affects_gross_profit smallint,
    sort_position integer
);


ALTER TABLE public.mst_group OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 17056)
-- Name: mst_gst_effective_rate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_gst_effective_rate (
    item character varying(1024),
    applicable_from date,
    hsn_description character varying(256),
    hsn_code character varying(64),
    duty_head character varying(64),
    rate numeric(9,4),
    rate_per_unit numeric(9,4),
    valuation_type character varying(64),
    is_rcm_applicable smallint,
    nature_of_transaction character varying(64),
    nature_of_goods character varying(64),
    supply_type character varying(64),
    taxability character varying(64)
);


ALTER TABLE public.mst_gst_effective_rate OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16960)
-- Name: mst_ledger; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_ledger (
    guid character varying(64) NOT NULL,
    name character varying(1024),
    parent character varying(1024),
    alias character varying(256),
    description character varying(64),
    notes character varying(64),
    is_revenue smallint,
    is_deemedpositive smallint,
    opening_balance numeric(17,2),
    closing_balance numeric(17,2),
    mailing_name character varying(256),
    mailing_address character varying(1024),
    mailing_state character varying(256),
    mailing_country character varying(256),
    mailing_pincode character varying(64),
    email character varying(256),
    mobile character varying(32),
    it_pan character varying(64),
    gstn character varying(64),
    gst_registration_type character varying(64),
    gst_supply_type character varying(64),
    gst_duty_head character varying(16),
    bank_account_holder character varying(256),
    bank_account_number character varying(64),
    bank_ifsc character varying(64),
    bank_swift character varying(64),
    bank_name character varying(64),
    bank_branch character varying(64),
    bill_credit_period integer
);


ALTER TABLE public.mst_ledger OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 17061)
-- Name: mst_opening_batch_allocation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_opening_batch_allocation (
    name character varying(1024),
    item character varying(1024),
    opening_balance numeric(15,4),
    opening_rate numeric(15,4),
    opening_value numeric(17,2),
    godown character varying(1024),
    manufactured_on date
);


ALTER TABLE public.mst_opening_batch_allocation OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 17066)
-- Name: mst_opening_bill_allocation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_opening_bill_allocation (
    ledger character varying(1024),
    opening_balance numeric(17,4),
    bill_date date,
    name character varying(1024),
    bill_credit_period integer,
    is_advance smallint
);


ALTER TABLE public.mst_opening_bill_allocation OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 17048)
-- Name: mst_payhead; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_payhead (
    guid character varying(64) NOT NULL,
    name character varying(1024),
    parent character varying(1024),
    payslip_name character varying(1024),
    pay_type character varying(64),
    income_type character varying(64),
    calculation_type character varying(32),
    leave_type character varying(64),
    calculation_period character varying(32)
);


ALTER TABLE public.mst_payhead OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16992)
-- Name: mst_stock_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_stock_category (
    guid character varying(64) NOT NULL,
    name character varying(1024),
    parent character varying(1024)
);


ALTER TABLE public.mst_stock_category OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17000)
-- Name: mst_stock_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_stock_group (
    guid character varying(64) NOT NULL,
    name character varying(1024),
    parent character varying(1024)
);


ALTER TABLE public.mst_stock_group OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17008)
-- Name: mst_stock_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_stock_item (
    guid character varying(64) NOT NULL,
    name character varying(1024),
    parent character varying(1024),
    category character varying(1024),
    alias character varying(256),
    description character varying(64),
    notes character varying(64),
    part_number character varying(256),
    uom character varying(32),
    alternate_uom character varying(32),
    conversion numeric(15,4),
    opening_balance numeric(15,4),
    opening_rate numeric(15,4),
    opening_value numeric(17,2),
    closing_balance numeric(15,4),
    closing_rate numeric(15,4),
    closing_value numeric(17,2),
    costing_method character varying(32),
    gst_type_of_supply character varying(32),
    gst_hsn_code character varying(64),
    gst_hsn_description character varying(256),
    gst_rate numeric(9,4),
    gst_taxability character varying(32)
);


ALTER TABLE public.mst_stock_item OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 17076)
-- Name: mst_stockitem_standard_cost; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_stockitem_standard_cost (
    item character varying(1024),
    date date,
    rate numeric(15,4)
);


ALTER TABLE public.mst_stockitem_standard_cost OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 17081)
-- Name: mst_stockitem_standard_price; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_stockitem_standard_price (
    item character varying(1024),
    date date,
    rate numeric(15,4)
);


ALTER TABLE public.mst_stockitem_standard_price OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16976)
-- Name: mst_uom; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_uom (
    guid character varying(64) NOT NULL,
    name character varying(1024),
    formalname character varying(256),
    is_simple_unit smallint,
    base_units character varying(1024),
    additional_units character varying(1024),
    conversion numeric(15,4)
);


ALTER TABLE public.mst_uom OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16968)
-- Name: mst_vouchertype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_vouchertype (
    guid character varying(64) NOT NULL,
    name character varying(1024),
    parent character varying(1024),
    numbering_method character varying(64),
    is_deemedpositive smallint,
    affects_stock smallint
);


ALTER TABLE public.mst_vouchertype OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 17094)
-- Name: trn_accounting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trn_accounting (
    guid character varying(64),
    ledger character varying(1024),
    amount numeric(17,2),
    amount_forex numeric(17,2),
    currency character varying(16)
);


ALTER TABLE public.trn_accounting OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 17149)
-- Name: trn_attendance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trn_attendance (
    guid character varying(64),
    employee_name character varying(1024),
    attendancetype_name character varying(1024),
    time_value numeric(17,2),
    type_value numeric(17,2)
);


ALTER TABLE public.trn_attendance OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 17124)
-- Name: trn_bank; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trn_bank (
    guid character varying(64),
    ledger character varying(1024),
    transaction_type character varying(32),
    instrument_date date,
    instrument_number character varying(1024),
    bank_name character varying(64),
    amount numeric(17,2),
    bankers_date date
);


ALTER TABLE public.trn_bank OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 17129)
-- Name: trn_batch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trn_batch (
    guid character varying(64),
    item character varying(1024),
    name character varying(1024),
    quantity numeric(15,4),
    amount numeric(17,2),
    godown character varying(1024),
    destination_godown character varying(1024),
    tracking_number character varying(1024)
);


ALTER TABLE public.trn_batch OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 17119)
-- Name: trn_bill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trn_bill (
    guid character varying(64),
    ledger character varying(1024),
    name character varying(1024),
    amount numeric(17,2),
    billtype character varying(256),
    bill_credit_period integer
);


ALTER TABLE public.trn_bill OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 17071)
-- Name: trn_closingstock_ledger; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trn_closingstock_ledger (
    ledger character varying(1024),
    stock_date date,
    stock_value numeric(17,2)
);


ALTER TABLE public.trn_closingstock_ledger OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 17109)
-- Name: trn_cost_category_centre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trn_cost_category_centre (
    guid character varying(64),
    ledger character varying(1024),
    costcategory character varying(1024),
    costcentre character varying(1024),
    amount numeric(17,2)
);


ALTER TABLE public.trn_cost_category_centre OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 17104)
-- Name: trn_cost_centre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trn_cost_centre (
    guid character varying(64),
    ledger character varying(1024),
    costcentre character varying(1024),
    amount numeric(17,2)
);


ALTER TABLE public.trn_cost_centre OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 17114)
-- Name: trn_cost_inventory_category_centre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trn_cost_inventory_category_centre (
    guid character varying(64),
    ledger character varying(1024),
    item character varying(1024),
    costcategory character varying(1024),
    costcentre character varying(1024),
    amount numeric(17,2)
);


ALTER TABLE public.trn_cost_inventory_category_centre OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 17139)
-- Name: trn_employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trn_employee (
    guid character varying(64),
    category character varying(1024),
    employee_name character varying(1024),
    amount numeric(17,2),
    employee_sort_order integer
);


ALTER TABLE public.trn_employee OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 17099)
-- Name: trn_inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trn_inventory (
    guid character varying(64),
    item character varying(1024),
    quantity numeric(15,4),
    rate numeric(15,4),
    amount numeric(17,2),
    additional_amount numeric(17,2),
    discount_amount numeric(17,2),
    godown character varying(1024),
    tracking_number character varying(256),
    order_number character varying(256),
    order_duedate date
);


ALTER TABLE public.trn_inventory OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 17134)
-- Name: trn_inventory_additional_cost; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trn_inventory_additional_cost (
    guid character varying(64),
    ledger character varying(1024),
    amount numeric(17,2),
    additional_allocation_type character varying(32),
    rate_of_invoice_tax numeric(9,4)
);


ALTER TABLE public.trn_inventory_additional_cost OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 17144)
-- Name: trn_payhead; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trn_payhead (
    guid character varying(64),
    category character varying(1024),
    employee_name character varying(1024),
    employee_sort_order integer,
    payhead_name character varying(1024),
    payhead_sort_order integer,
    amount numeric(17,2)
);


ALTER TABLE public.trn_payhead OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 17086)
-- Name: trn_voucher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trn_voucher (
    guid character varying(64) NOT NULL,
    date date,
    voucher_type character varying(1024),
    voucher_number character varying(64),
    reference_number character varying(64),
    reference_date date,
    narration character varying(4000),
    party_name character varying(256),
    place_of_supply character varying(256),
    is_invoice smallint,
    is_accounting_voucher smallint,
    is_inventory_voucher smallint,
    is_order_voucher smallint
);


ALTER TABLE public.trn_voucher OWNER TO postgres;

--
-- TOC entry 5160 (class 0 OID 16944)
-- Dependencies: 219
-- Data for Name: config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.config (name, value) FROM stdin;
Update Timestamp	1/6/2026, 3:33:46 pm
Company Name	NPAV
Period From	2026-04-01
Period To	2026-04-01
Last AlterID Master	221
Last AlterID Transaction	NaN
\.


--
-- TOC entry 5171 (class 0 OID 17032)
-- Dependencies: 230
-- Data for Name: mst_attendance_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mst_attendance_type (guid, name, parent, uom, attendance_type, attendance_period) FROM stdin;
\.


--
-- TOC entry 5169 (class 0 OID 17016)
-- Dependencies: 228
-- Data for Name: mst_cost_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mst_cost_category (guid, name, allocate_revenue, allocate_non_revenue) FROM stdin;
fc6f4e04-652d-453e-badd-ea9f66f41393-00000062	Primary Cost Category	1	1
\.


--
-- TOC entry 5170 (class 0 OID 17024)
-- Dependencies: 229
-- Data for Name: mst_cost_centre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mst_cost_centre (guid, name, parent, category) FROM stdin;
\.


--
-- TOC entry 5172 (class 0 OID 17040)
-- Dependencies: 231
-- Data for Name: mst_employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mst_employee (guid, name, parent, id_number, date_of_joining, date_of_release, designation, function_role, location, gender, date_of_birth, blood_group, father_mother_name, spouse_name, address, mobile, email, pan, aadhar, uan, pf_number, pf_joining_date, pf_relieving_date, pr_account_number) FROM stdin;
\.


--
-- TOC entry 5165 (class 0 OID 16984)
-- Dependencies: 224
-- Data for Name: mst_godown; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mst_godown (guid, name, parent, address) FROM stdin;
fc6f4e04-652d-453e-badd-ea9f66f41393-00000063	Main Location		
\.


--
-- TOC entry 5161 (class 0 OID 16952)
-- Dependencies: 220
-- Data for Name: mst_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mst_group (guid, name, parent, primary_group, is_revenue, is_deemedpositive, is_reserved, affects_gross_profit, sort_position) FROM stdin;
fc6f4e04-652d-453e-badd-ea9f66f41393-00000016	Bank Accounts	Current Assets	Bank Accounts	0	1	1	0	220
fc6f4e04-652d-453e-badd-ea9f66f41393-000000d1	Banking	Capital Account	Capital Account	0	0	0	0	500
fc6f4e04-652d-453e-badd-ea9f66f41393-0000000b	Bank OD A/c	Loans (Liability)	Bank OD A/c	0	0	1	0	110
fc6f4e04-652d-453e-badd-ea9f66f41393-00000007	Branch / Divisions		Branch / Divisions	0	0	1	0	70
fc6f4e04-652d-453e-badd-ea9f66f41393-00000001	Capital Account		Capital Account	0	0	1	0	10
fc6f4e04-652d-453e-badd-ea9f66f41393-00000015	Cash-in-Hand	Current Assets	Cash-in-Hand	0	1	1	0	210
fc6f4e04-652d-453e-badd-ea9f66f41393-00000006	Current Assets		Current Assets	0	1	1	0	60
fc6f4e04-652d-453e-badd-ea9f66f41393-00000003	Current Liabilities		Current Liabilities	0	0	1	0	30
fc6f4e04-652d-453e-badd-ea9f66f41393-000000d6	Demo	Cash-in-Hand	Cash-in-Hand	0	1	0	0	500
fc6f4e04-652d-453e-badd-ea9f66f41393-00000012	Deposits (Asset)	Current Assets	Deposits (Asset)	0	1	1	0	180
fc6f4e04-652d-453e-badd-ea9f66f41393-0000001a	Direct Expenses		Direct Expenses	1	1	1	1	260
fc6f4e04-652d-453e-badd-ea9f66f41393-00000019	Direct Incomes		Direct Incomes	1	0	1	1	250
fc6f4e04-652d-453e-badd-ea9f66f41393-0000000e	Duties & Taxes	Current Liabilities	Duties & Taxes	0	0	1	0	140
fc6f4e04-652d-453e-badd-ea9f66f41393-00000004	Fixed Assets		Fixed Assets	0	1	1	0	40
fc6f4e04-652d-453e-badd-ea9f66f41393-0000001c	Indirect Expenses		Indirect Expenses	1	1	1	0	280
fc6f4e04-652d-453e-badd-ea9f66f41393-0000001b	Indirect Incomes		Indirect Incomes	1	0	1	0	270
fc6f4e04-652d-453e-badd-ea9f66f41393-00000005	Investments		Investments	0	1	1	0	50
fc6f4e04-652d-453e-badd-ea9f66f41393-00000013	Loans & Advances (Asset)	Current Assets	Loans & Advances (Asset)	0	1	1	0	190
fc6f4e04-652d-453e-badd-ea9f66f41393-00000002	Loans (Liability)		Loans (Liability)	0	0	1	0	20
fc6f4e04-652d-453e-badd-ea9f66f41393-00000008	Misc. Expenses (ASSET)		Misc. Expenses (ASSET)	0	1	1	0	80
fc6f4e04-652d-453e-badd-ea9f66f41393-0000000f	Provisions	Current Liabilities	Provisions	0	0	1	0	150
fc6f4e04-652d-453e-badd-ea9f66f41393-00000018	Purchase Accounts		Purchase Accounts	1	1	1	1	240
fc6f4e04-652d-453e-badd-ea9f66f41393-0000000a	Reserves & Surplus	Capital Account	Reserves & Surplus	0	0	1	0	100
fc6f4e04-652d-453e-badd-ea9f66f41393-00000017	Sales Accounts		Sales Accounts	1	0	1	1	230
fc6f4e04-652d-453e-badd-ea9f66f41393-0000000c	Secured Loans	Loans (Liability)	Secured Loans	0	0	1	0	120
fc6f4e04-652d-453e-badd-ea9f66f41393-000000d0	Security	Secured Loans	Secured Loans	0	0	0	0	500
fc6f4e04-652d-453e-badd-ea9f66f41393-00000011	Stock-in-Hand	Current Assets	Stock-in-Hand	0	1	1	0	170
fc6f4e04-652d-453e-badd-ea9f66f41393-00000010	Sundry Creditors	Current Liabilities	Sundry Creditors	0	0	1	0	160
fc6f4e04-652d-453e-badd-ea9f66f41393-00000014	Sundry Debtors	Current Assets	Sundry Debtors	0	1	1	0	200
fc6f4e04-652d-453e-badd-ea9f66f41393-00000009	Suspense A/c		Suspense A/c	0	0	1	0	90
fc6f4e04-652d-453e-badd-ea9f66f41393-0000000d	Unsecured Loans	Loans (Liability)	Unsecured Loans	0	0	1	0	130
\.


--
-- TOC entry 5174 (class 0 OID 17056)
-- Dependencies: 233
-- Data for Name: mst_gst_effective_rate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mst_gst_effective_rate (item, applicable_from, hsn_description, hsn_code, duty_head, rate, rate_per_unit, valuation_type, is_rcm_applicable, nature_of_transaction, nature_of_goods, supply_type, taxability) FROM stdin;
\.


--
-- TOC entry 5162 (class 0 OID 16960)
-- Dependencies: 221
-- Data for Name: mst_ledger; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mst_ledger (guid, name, parent, alias, description, notes, is_revenue, is_deemedpositive, opening_balance, closing_balance, mailing_name, mailing_address, mailing_state, mailing_country, mailing_pincode, email, mobile, it_pan, gstn, gst_registration_type, gst_supply_type, gst_duty_head, bank_account_holder, bank_account_number, bank_ifsc, bank_swift, bank_name, bank_branch, bill_credit_period) FROM stdin;
fc6f4e04-652d-453e-badd-ea9f66f41393-0000001f	Cash	Cash-in-Hand				0	1	0.00	0.00																			0
fc6f4e04-652d-453e-badd-ea9f66f41393-000000d7	Demo Ledger	Capital Account				0	0	0.00	0.00	Demo Ledger			India						Regular									0
fc6f4e04-652d-453e-badd-ea9f66f41393-0000001e	Profit & Loss A/c					0	0	0.00	0.00																			0
\.


--
-- TOC entry 5175 (class 0 OID 17061)
-- Dependencies: 234
-- Data for Name: mst_opening_batch_allocation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mst_opening_batch_allocation (name, item, opening_balance, opening_rate, opening_value, godown, manufactured_on) FROM stdin;
\.


--
-- TOC entry 5176 (class 0 OID 17066)
-- Dependencies: 235
-- Data for Name: mst_opening_bill_allocation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mst_opening_bill_allocation (ledger, opening_balance, bill_date, name, bill_credit_period, is_advance) FROM stdin;
\.


--
-- TOC entry 5173 (class 0 OID 17048)
-- Dependencies: 232
-- Data for Name: mst_payhead; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mst_payhead (guid, name, parent, payslip_name, pay_type, income_type, calculation_type, leave_type, calculation_period) FROM stdin;
\.


--
-- TOC entry 5166 (class 0 OID 16992)
-- Dependencies: 225
-- Data for Name: mst_stock_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mst_stock_category (guid, name, parent) FROM stdin;
\.


--
-- TOC entry 5167 (class 0 OID 17000)
-- Dependencies: 226
-- Data for Name: mst_stock_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mst_stock_group (guid, name, parent) FROM stdin;
fc6f4e04-652d-453e-badd-ea9f66f41393-000000ce	Electronics	
fc6f4e04-652d-453e-badd-ea9f66f41393-000000cf	Fan	
\.


--
-- TOC entry 5168 (class 0 OID 17008)
-- Dependencies: 227
-- Data for Name: mst_stock_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mst_stock_item (guid, name, parent, category, alias, description, notes, part_number, uom, alternate_uom, conversion, opening_balance, opening_rate, opening_value, closing_balance, closing_rate, closing_value, costing_method, gst_type_of_supply, gst_hsn_code, gst_hsn_description, gst_rate, gst_taxability) FROM stdin;
\.


--
-- TOC entry 5178 (class 0 OID 17076)
-- Dependencies: 237
-- Data for Name: mst_stockitem_standard_cost; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mst_stockitem_standard_cost (item, date, rate) FROM stdin;
\.


--
-- TOC entry 5179 (class 0 OID 17081)
-- Dependencies: 238
-- Data for Name: mst_stockitem_standard_price; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mst_stockitem_standard_price (item, date, rate) FROM stdin;
\.


--
-- TOC entry 5164 (class 0 OID 16976)
-- Dependencies: 223
-- Data for Name: mst_uom; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mst_uom (guid, name, formalname, is_simple_unit, base_units, additional_units, conversion) FROM stdin;
fc6f4e04-652d-453e-badd-ea9f66f41393-000000d2	Kg	Kilogram	1			0.0000
fc6f4e04-652d-453e-badd-ea9f66f41393-000000d3	L	Liter	1			0.0000
fc6f4e04-652d-453e-badd-ea9f66f41393-000000d4	m	Mertre	1			0.0000
fc6f4e04-652d-453e-badd-ea9f66f41393-000000d5	Pcs	Pieces	1			0.0000
\.


--
-- TOC entry 5163 (class 0 OID 16968)
-- Dependencies: 222
-- Data for Name: mst_vouchertype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mst_vouchertype (guid, name, parent, numbering_method, is_deemedpositive, affects_stock) FROM stdin;
fc6f4e04-652d-453e-badd-ea9f66f41393-0000004e	Attendance	Attendance	Default	1	0
fc6f4e04-652d-453e-badd-ea9f66f41393-00000020	Contra	Contra	Default	0	0
fc6f4e04-652d-453e-badd-ea9f66f41393-00000028	Credit Note	Credit Note	Default	0	0
fc6f4e04-652d-453e-badd-ea9f66f41393-0000002a	Debit Note	Debit Note	Default	1	0
fc6f4e04-652d-453e-badd-ea9f66f41393-00000030	Delivery Note	Delivery Note	Default	0	1
fc6f4e04-652d-453e-badd-ea9f66f41393-00000052	Job Work In Order	Job Work In Order	Default	1	0
fc6f4e04-652d-453e-badd-ea9f66f41393-00000054	Job Work Out Order	Job Work Out Order	Default	0	0
fc6f4e04-652d-453e-badd-ea9f66f41393-00000026	Journal	Journal	Default	1	0
fc6f4e04-652d-453e-badd-ea9f66f41393-00000058	Material In	Material In	Default	1	1
fc6f4e04-652d-453e-badd-ea9f66f41393-00000056	Material Out	Material Out	Default	1	1
fc6f4e04-652d-453e-badd-ea9f66f41393-0000003c	Memorandum	Memorandum	Default	1	0
fc6f4e04-652d-453e-badd-ea9f66f41393-00000022	Payment	Payment	Default	1	0
fc6f4e04-652d-453e-badd-ea9f66f41393-00000050	Payroll	Payroll	Default	1	0
fc6f4e04-652d-453e-badd-ea9f66f41393-00000038	Physical Stock	Physical Stock	Default	1	1
fc6f4e04-652d-453e-badd-ea9f66f41393-0000002e	Purchase	Purchase	Default	0	0
fc6f4e04-652d-453e-badd-ea9f66f41393-00000042	Purchase Order	Purchase Order	Default	0	0
fc6f4e04-652d-453e-badd-ea9f66f41393-00000024	Receipt	Receipt	Default	0	0
fc6f4e04-652d-453e-badd-ea9f66f41393-00000032	Receipt Note	Receipt Note	Default	1	1
fc6f4e04-652d-453e-badd-ea9f66f41393-00000036	Rejections In	Rejections In	Default	1	1
fc6f4e04-652d-453e-badd-ea9f66f41393-00000034	Rejections Out	Rejections Out	Default	0	1
fc6f4e04-652d-453e-badd-ea9f66f41393-0000003e	Reversing Journal	Reversing Journal	Default	1	0
fc6f4e04-652d-453e-badd-ea9f66f41393-0000002c	Sales	Sales	Default	1	0
fc6f4e04-652d-453e-badd-ea9f66f41393-00000040	Sales Order	Sales Order	Default	1	0
fc6f4e04-652d-453e-badd-ea9f66f41393-0000003a	Stock Journal	Stock Journal	Default	1	1
\.


--
-- TOC entry 5181 (class 0 OID 17094)
-- Dependencies: 240
-- Data for Name: trn_accounting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trn_accounting (guid, ledger, amount, amount_forex, currency) FROM stdin;
\.


--
-- TOC entry 5192 (class 0 OID 17149)
-- Dependencies: 251
-- Data for Name: trn_attendance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trn_attendance (guid, employee_name, attendancetype_name, time_value, type_value) FROM stdin;
\.


--
-- TOC entry 5187 (class 0 OID 17124)
-- Dependencies: 246
-- Data for Name: trn_bank; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trn_bank (guid, ledger, transaction_type, instrument_date, instrument_number, bank_name, amount, bankers_date) FROM stdin;
\.


--
-- TOC entry 5188 (class 0 OID 17129)
-- Dependencies: 247
-- Data for Name: trn_batch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trn_batch (guid, item, name, quantity, amount, godown, destination_godown, tracking_number) FROM stdin;
\.


--
-- TOC entry 5186 (class 0 OID 17119)
-- Dependencies: 245
-- Data for Name: trn_bill; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trn_bill (guid, ledger, name, amount, billtype, bill_credit_period) FROM stdin;
\.


--
-- TOC entry 5177 (class 0 OID 17071)
-- Dependencies: 236
-- Data for Name: trn_closingstock_ledger; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trn_closingstock_ledger (ledger, stock_date, stock_value) FROM stdin;
\.


--
-- TOC entry 5184 (class 0 OID 17109)
-- Dependencies: 243
-- Data for Name: trn_cost_category_centre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trn_cost_category_centre (guid, ledger, costcategory, costcentre, amount) FROM stdin;
\.


--
-- TOC entry 5183 (class 0 OID 17104)
-- Dependencies: 242
-- Data for Name: trn_cost_centre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trn_cost_centre (guid, ledger, costcentre, amount) FROM stdin;
\.


--
-- TOC entry 5185 (class 0 OID 17114)
-- Dependencies: 244
-- Data for Name: trn_cost_inventory_category_centre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trn_cost_inventory_category_centre (guid, ledger, item, costcategory, costcentre, amount) FROM stdin;
\.


--
-- TOC entry 5190 (class 0 OID 17139)
-- Dependencies: 249
-- Data for Name: trn_employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trn_employee (guid, category, employee_name, amount, employee_sort_order) FROM stdin;
\.


--
-- TOC entry 5182 (class 0 OID 17099)
-- Dependencies: 241
-- Data for Name: trn_inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trn_inventory (guid, item, quantity, rate, amount, additional_amount, discount_amount, godown, tracking_number, order_number, order_duedate) FROM stdin;
\.


--
-- TOC entry 5189 (class 0 OID 17134)
-- Dependencies: 248
-- Data for Name: trn_inventory_additional_cost; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trn_inventory_additional_cost (guid, ledger, amount, additional_allocation_type, rate_of_invoice_tax) FROM stdin;
\.


--
-- TOC entry 5191 (class 0 OID 17144)
-- Dependencies: 250
-- Data for Name: trn_payhead; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trn_payhead (guid, category, employee_name, employee_sort_order, payhead_name, payhead_sort_order, amount) FROM stdin;
\.


--
-- TOC entry 5180 (class 0 OID 17086)
-- Dependencies: 239
-- Data for Name: trn_voucher; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trn_voucher (guid, date, voucher_type, voucher_number, reference_number, reference_date, narration, party_name, place_of_supply, is_invoice, is_accounting_voucher, is_inventory_voucher, is_order_voucher) FROM stdin;
\.


--
-- TOC entry 4984 (class 2606 OID 16951)
-- Name: config config_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_pkey PRIMARY KEY (name);


--
-- TOC entry 5006 (class 2606 OID 17039)
-- Name: mst_attendance_type mst_attendance_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_attendance_type
    ADD CONSTRAINT mst_attendance_type_pkey PRIMARY KEY (guid);


--
-- TOC entry 5002 (class 2606 OID 17023)
-- Name: mst_cost_category mst_cost_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_cost_category
    ADD CONSTRAINT mst_cost_category_pkey PRIMARY KEY (guid);


--
-- TOC entry 5004 (class 2606 OID 17031)
-- Name: mst_cost_centre mst_cost_centre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_cost_centre
    ADD CONSTRAINT mst_cost_centre_pkey PRIMARY KEY (guid);


--
-- TOC entry 5008 (class 2606 OID 17047)
-- Name: mst_employee mst_employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_employee
    ADD CONSTRAINT mst_employee_pkey PRIMARY KEY (guid);


--
-- TOC entry 4994 (class 2606 OID 16991)
-- Name: mst_godown mst_godown_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_godown
    ADD CONSTRAINT mst_godown_pkey PRIMARY KEY (guid);


--
-- TOC entry 4986 (class 2606 OID 16959)
-- Name: mst_group mst_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_group
    ADD CONSTRAINT mst_group_pkey PRIMARY KEY (guid);


--
-- TOC entry 4988 (class 2606 OID 16967)
-- Name: mst_ledger mst_ledger_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_ledger
    ADD CONSTRAINT mst_ledger_pkey PRIMARY KEY (guid);


--
-- TOC entry 5010 (class 2606 OID 17055)
-- Name: mst_payhead mst_payhead_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_payhead
    ADD CONSTRAINT mst_payhead_pkey PRIMARY KEY (guid);


--
-- TOC entry 4996 (class 2606 OID 16999)
-- Name: mst_stock_category mst_stock_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_stock_category
    ADD CONSTRAINT mst_stock_category_pkey PRIMARY KEY (guid);


--
-- TOC entry 4998 (class 2606 OID 17007)
-- Name: mst_stock_group mst_stock_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_stock_group
    ADD CONSTRAINT mst_stock_group_pkey PRIMARY KEY (guid);


--
-- TOC entry 5000 (class 2606 OID 17015)
-- Name: mst_stock_item mst_stock_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_stock_item
    ADD CONSTRAINT mst_stock_item_pkey PRIMARY KEY (guid);


--
-- TOC entry 4992 (class 2606 OID 16983)
-- Name: mst_uom mst_uom_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_uom
    ADD CONSTRAINT mst_uom_pkey PRIMARY KEY (guid);


--
-- TOC entry 4990 (class 2606 OID 16975)
-- Name: mst_vouchertype mst_vouchertype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_vouchertype
    ADD CONSTRAINT mst_vouchertype_pkey PRIMARY KEY (guid);


--
-- TOC entry 5012 (class 2606 OID 17093)
-- Name: trn_voucher trn_voucher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trn_voucher
    ADD CONSTRAINT trn_voucher_pkey PRIMARY KEY (guid);


--
-- TOC entry 5199 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


-- Completed on 2026-06-02 05:16:32

--
-- PostgreSQL database dump complete
--

\unrestrict TOeyM8lo8GAukxW7A1MNaDeCzfEzfaSbBSkm2hSQKDtClmtpIOuGFvxeYkbw9fI

