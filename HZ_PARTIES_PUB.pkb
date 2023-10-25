CREATE OR REPLACE package APPS.HZ_PARTY_PUB AUTHID CURRENT_USER AS
/*$Header: ARHPTYSS.pls 115.54 2004/05/03 20:00:16 rborah ship $ */

G_MISS_CONTENT_SOURCE_TYPE		VARCHAR2(60) := 'USER_ENTERED';

TYPE party_rec_type IS RECORD(
	party_id			NUMBER := FND_API.G_MISS_NUM,
	party_number			VARCHAR2(30):= FND_API.G_MISS_CHAR,
	validated_flag			VARCHAR2(1):= FND_API.G_MISS_CHAR,
	orig_system_reference		VARCHAR2(240):= FND_API.G_MISS_CHAR,
	customer_key                    VARCHAR2(500):= FND_API.G_MISS_CHAR,
	status				VARCHAR2(1):= FND_API.G_MISS_CHAR,
	TOTAL_NUM_OF_ORDERS		NUMBER := FND_API.G_MISS_NUM,
	TOTAL_ORDERED_AMOUNT		NUMBER := FND_API.G_MISS_NUM,
	LAST_ORDERED_DATE		DATE := FND_API.G_MISS_DATE,
 	category_code                   VARCHAR2(30) := FND_API.G_MISS_CHAR,
	salutation			VARCHAR2(60):= FND_API.G_MISS_CHAR,
	attribute_category		VARCHAR2(30):= FND_API.G_MISS_CHAR,
	attribute1			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute2			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute3			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute4			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute5			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute6			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute7			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute8			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute9			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute10			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute11			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute12			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute13			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute14			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute15			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute16			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute17			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute18			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute19			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute20			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute21                     VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute22                     VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute23                     VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute24                     VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute_category	VARCHAR2(30) :=  FND_API.G_MISS_CHAR,
	global_attribute1		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute2		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute3		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute4		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute5		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute6		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute7		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute8		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute9		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute10		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute11		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute12		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute13		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute14		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute15		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute16		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute17		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute18		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute19		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute20		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	wh_update_date			DATE:= FND_API.G_MISS_DATE
);

G_MISS_PARTY_REC                PARTY_REC_TYPE;


TYPE person_rec_type IS RECORD(
        pre_name_adjunct		VARCHAR2(30):= FND_API.G_MISS_CHAR,
        first_name			VARCHAR2(150):= FND_API.G_MISS_CHAR,
        middle_name			VARCHAR2(60):= FND_API.G_MISS_CHAR,
        last_name			VARCHAR2(150):=FND_API.G_MISS_CHAR,
        name_suffix			VARCHAR2(30):= FND_API.G_MISS_CHAR,
        title				VARCHAR2(60):= FND_API.G_MISS_CHAR,
        academic_title			VARCHAR2(30):= FND_API.G_MISS_CHAR,
        previous_last_name		VARCHAR2(150):= FND_API.G_MISS_CHAR,
        initials			VARCHAR2(6):= FND_API.G_MISS_CHAR,
        known_as                        VARCHAR2(240):= FND_API.G_MISS_CHAR,
        known_as2                       VARCHAR2(240):= FND_API.G_MISS_CHAR,
        known_as3                       VARCHAR2(240):= FND_API.G_MISS_CHAR,
        known_as4                       VARCHAR2(240):= FND_API.G_MISS_CHAR,
        known_as5                       VARCHAR2(240):= FND_API.G_MISS_CHAR,
        tax_name                        VARCHAR2(60) := FND_API.G_MISS_CHAR,
        person_name_phonetic            VARCHAR2(320) :=FND_API.G_MISS_CHAR,
        first_name_phonetic		VARCHAR2(60):= FND_API.G_MISS_CHAR,
        last_name_phonetic		VARCHAR2(60):= FND_API.G_MISS_CHAR,
        middle_name_phonetic		VARCHAR2(60):= FND_API.G_MISS_CHAR,
        tax_reference                   VARCHAR2(50) := FND_API.G_MISS_CHAR,
        jgzz_fiscal_code                VARCHAR2(20):= FND_API.G_MISS_CHAR,
        primary_contact_id		NUMBER:= FND_API.G_MISS_NUM,
        person_iden_type		VARCHAR2(30):= FND_API.G_MISS_CHAR,
        person_identifier		VARCHAR2(60):= FND_API.G_MISS_CHAR,
        date_of_birth			DATE:= FND_API.G_MISS_DATE,
        place_of_birth			VARCHAR2(60):= FND_API.G_MISS_CHAR,
        date_of_death			DATE:= FND_API.G_MISS_DATE,
        gender				VARCHAR2(30):= FND_API.G_MISS_CHAR,
        declared_ethnicity		VARCHAR2(60):= FND_API.G_MISS_CHAR,
        marital_status			VARCHAR2(30):= FND_API.G_MISS_CHAR,
        marital_status_effective_date	DATE:= FND_API.G_MISS_DATE,
        personal_income			NUMBER:= FND_API.G_MISS_NUM,
        head_of_household_flag		VARCHAR2(1):= FND_API.G_MISS_CHAR,
        household_income		NUMBER:= FND_API.G_MISS_NUM,
        household_size			NUMBER:= FND_API.G_MISS_NUM,
        rent_own_ind			VARCHAR2(30):= FND_API.G_MISS_CHAR,
        last_known_gps			VARCHAR2(60):= FND_API.G_MISS_CHAR,
        best_time_contact_begin         DATE:= FND_API.G_MISS_DATE,
        best_time_contact_end           DATE:= FND_API.G_MISS_DATE,
        internal_flag                   VARCHAR2(2) := FND_API.G_MISS_CHAR,
        content_source_type		VARCHAR2(30):= G_MISS_CONTENT_SOURCE_TYPE,
        content_source_number		VARCHAR2(30):= FND_API.G_MISS_CHAR,
	attribute_category              VARCHAR2(30):= FND_API.G_MISS_CHAR,
        attribute1                      VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute2                      VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute3                      VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute4                      VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute5                      VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute6                      VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute7                      VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute8                      VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute9                      VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute10                     VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute11                     VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute12                     VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute13                     VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute14                     VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute15                     VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute16                     VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute17                     VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute18                     VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute19                     VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute20                     VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute_category       VARCHAR2(30) := FND_API.G_MISS_CHAR,
        global_attribute1               VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute2               VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute3               VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute4               VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute5               VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute6               VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute7               VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute8               VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute9               VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute10              VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute11              VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute12              VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute13              VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute14              VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute15              VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute16              VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute17              VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute18              VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute19              VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute20              VARCHAR2(150) := FND_API.G_MISS_CHAR,
        wh_update_date                  DATE:= FND_API.G_MISS_DATE,
	party_rec                       PARTY_REC_TYPE := G_MISS_PARTY_REC
);

G_MISS_PERSON_REC	PERSON_REC_TYPE;

TYPE group_rec_type IS RECORD(
        group_name		        VARCHAR2(255) := FND_API.G_MISS_CHAR,
        group_type		        VARCHAR2(30) := FND_API.G_MISS_CHAR,
        wh_update_date		        DATE:= FND_API.G_MISS_DATE,
        party_rec                       PARTY_REC_TYPE := G_MISS_PARTY_REC
);

G_MISS_GROUP_REC	GROUP_REC_TYPE;

TYPE party_rel_rec_type IS RECORD(
	party_relationship_id	        NUMBER:= FND_API.G_MISS_NUM,
	subject_id		        NUMBER:= FND_API.G_MISS_NUM,
	object_id		        NUMBER:= FND_API.G_MISS_NUM,
	party_relationship_type        	VARCHAR2(30) := FND_API.G_MISS_CHAR,
	directional_flag	        VARCHAR2(1) := FND_API.G_MISS_CHAR,
	comments		        VARCHAR2(240):=FND_API.G_MISS_CHAR,
	start_date		        DATE:= FND_API.G_MISS_DATE,
	end_date		        DATE := FND_API.G_MISS_DATE,
	status                          VARCHAR2(1):= FND_API.G_MISS_CHAR,
	content_source_type             VARCHAR2(30):= G_MISS_CONTENT_SOURCE_TYPE,
	attribute_category	        VARCHAR2(30):= FND_API.G_MISS_CHAR,
	attribute1		        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute2		        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute3		        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute4		        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute5		        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute6		        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute7		        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute8		        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute9		        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute10		        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute11		        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute12		        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute13		        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute14		        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute15		        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute16		        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute17		        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute18		        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute19		        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute20		        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute_category       VARCHAR2(30) := FND_API.G_MISS_CHAR,
	global_attribute1	        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute2	        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute3	        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute4	        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute5	        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute6	        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute7	        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute8	        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute9	        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute10	        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute11	        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute12	        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute13	        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute14	        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute15	        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute16	        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute17	        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute18	        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute19	        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute20	        VARCHAR2(150) := FND_API.G_MISS_CHAR,
	wh_update_date		        DATE:= FND_API.G_MISS_DATE,
	party_rec		        PARTY_REC_TYPE := G_MISS_PARTY_REC
);


G_MISS_PARTY_REL_REC            PARTY_REL_REC_TYPE;


TYPE organization_rec_type IS RECORD(
	organization_name		VARCHAR2(360) := FND_API.G_MISS_CHAR,
	duns_number                     NUMBER := FND_API.G_MISS_NUM,
	duns_number_c			VARCHAR2(30):= FND_API.G_MISS_CHAR,
	enquiry_duns			VARCHAR2(15):= FND_API.G_MISS_CHAR,
	ceo_name			VARCHAR2(240):= FND_API.G_MISS_CHAR,
	ceo_title			VARCHAR2(240):= FND_API.G_MISS_CHAR,
	principal_name			VARCHAR2(240):= FND_API.G_MISS_CHAR,
	principal_title			VARCHAR2(240):= FND_API.G_MISS_CHAR,
	legal_status			VARCHAR2(30):= FND_API.G_MISS_CHAR,
	control_yr			NUMBER := FND_API.G_MISS_NUM,
	employees_total			NUMBER := FND_API.G_MISS_NUM,
	hq_branch_ind			VARCHAR2(30) := FND_API.G_MISS_CHAR,
	branch_flag			VARCHAR2(1) := FND_API.G_MISS_CHAR,
	oob_ind				VARCHAR2(30) := FND_API.G_MISS_CHAR,
	line_of_business		VARCHAR2(240) := FND_API.G_MISS_CHAR,
	cong_dist_code			VARCHAR2(2) := FND_API.G_MISS_CHAR,
	sic_code			VARCHAR2(30) := FND_API.G_MISS_CHAR,
	import_ind			VARCHAR2(30) := FND_API.G_MISS_CHAR,
	export_ind			VARCHAR2(30) := FND_API.G_MISS_CHAR,
	labor_surplus_ind		VARCHAR2(30) := FND_API.G_MISS_CHAR,
	debarment_ind			VARCHAR2(30) := FND_API.G_MISS_CHAR,
	minority_owned_ind		VARCHAR2(30) := FND_API.G_MISS_CHAR,
	minority_owned_type		VARCHAR2(30) := FND_API.G_MISS_CHAR,
	woman_owned_ind			VARCHAR2(30) := FND_API.G_MISS_CHAR,
	disadv_8a_ind			VARCHAR2(30) := FND_API.G_MISS_CHAR,
	small_bus_ind			VARCHAR2(30) := FND_API.G_MISS_CHAR,
	rent_own_ind                    VARCHAR2(30):= FND_API.G_MISS_CHAR,
	debarments_count		NUMBER := FND_API.G_MISS_NUM,
	debarments_date			DATE:= FND_API.G_MISS_DATE,
	failure_score			VARCHAR2(30) := FND_API.G_MISS_CHAR,
	failure_score_natnl_percentile	NUMBER := FND_API.G_MISS_NUM,
-- Bug 1377807: failure_score_natl_persntil is obsoleted
        failure_score_natl_percentile   VARCHAR2(3) := FND_API.G_MISS_CHAR,
	failure_score_override_code	VARCHAR2(30) := FND_API.G_MISS_CHAR,
	failure_score_commentary	VARCHAR2(30) := FND_API.G_MISS_CHAR,
	global_failure_score		VARCHAR2(5) := FND_API.G_MISS_CHAR,
	db_rating			VARCHAR2(5) := FND_API.G_MISS_CHAR,
	credit_score			VARCHAR2(30) := FND_API.G_MISS_CHAR,
	credit_score_commentary		VARCHAR2(30) := FND_API.G_MISS_CHAR,
	paydex_score			VARCHAR2(3) := FND_API.G_MISS_CHAR,
	paydex_three_months_ago		VARCHAR2(3) := FND_API.G_MISS_CHAR,
	paydex_norm			VARCHAR2(3) := FND_API.G_MISS_CHAR,
	best_time_contact_begin         DATE:= FND_API.G_MISS_DATE,
        best_time_contact_end           DATE:= FND_API.G_MISS_DATE,
	organization_name_phonetic      VARCHAR2(320) :=FND_API.G_MISS_CHAR,
	tax_name                        VARCHAR2(60) := FND_API.G_MISS_CHAR,
	tax_reference                   VARCHAR2(50) := FND_API.G_MISS_CHAR,
	gsa_indicator_flag              VARCHAR2(1) := FND_API.G_MISS_CHAR,
	jgzz_fiscal_code                VARCHAR2(20):= FND_API.G_MISS_CHAR,
	analysis_fy			VARCHAR2(5) := FND_API.G_MISS_CHAR,
	fiscal_yearend_month		VARCHAR2(30) := FND_API.G_MISS_CHAR,
	curr_fy_potential_revenue	NUMBER := FND_API.G_MISS_NUM,
	next_fy_potential_revenue	NUMBER := FND_API.G_MISS_NUM,
	year_established		NUMBER := FND_API.G_MISS_NUM,
	mission_statement		VARCHAR2(2000) :=FND_API.G_MISS_CHAR,
	organization_type		VARCHAR2(30) := FND_API.G_MISS_CHAR,
	business_scope			VARCHAR2(20) := FND_API.G_MISS_CHAR,
	corporation_class		VARCHAR2(60) := FND_API.G_MISS_CHAR,
	known_as                        VARCHAR2(240):= FND_API.G_MISS_CHAR,
	known_as2                       VARCHAR2(240):= FND_API.G_MISS_CHAR,
	known_as3                       VARCHAR2(240):= FND_API.G_MISS_CHAR,
	known_as4                       VARCHAR2(240):= FND_API.G_MISS_CHAR,
	known_as5                       VARCHAR2(240):= FND_API.G_MISS_CHAR,
	local_bus_iden_type		VARCHAR2(30) := FND_API.G_MISS_CHAR,
	local_bus_identifier		VARCHAR2(60) := FND_API.G_MISS_CHAR,
	pref_functional_currency	VARCHAR2(30) := FND_API.G_MISS_CHAR,
	registration_type		VARCHAR2(30) := FND_API.G_MISS_CHAR,
	total_employees_text		VARCHAR2(60) := FND_API.G_MISS_CHAR,
	total_employees_ind		VARCHAR2(30) := FND_API.G_MISS_CHAR,
	total_emp_est_ind		VARCHAR2(30) := FND_API.G_MISS_CHAR,
	total_emp_min_ind		VARCHAR2(30) := FND_API.G_MISS_CHAR,
	parent_sub_ind			VARCHAR2(30) := FND_API.G_MISS_CHAR,
	incorp_year			NUMBER := FND_API.G_MISS_NUM,
	primary_contact_id		NUMBER := FND_API.G_MISS_NUM,
	sic_code_type                   VARCHAR2(30) := FND_API.G_MISS_CHAR,
        public_private_ownership_flag   VARCHAR2(1) := FND_API.G_MISS_CHAR,
        internal_flag			VARCHAR2(30) := FND_API.G_MISS_CHAR,
        local_activity_code_type        VARCHAR2(30) := FND_API.G_MISS_CHAR,
        local_activity_code             VARCHAR2(30) := FND_API.G_MISS_CHAR,
        emp_at_primary_adr              VARCHAR2(10) := FND_API.G_MISS_CHAR,
        emp_at_primary_adr_text         VARCHAR2(12) := FND_API.G_MISS_CHAR,
        emp_at_primary_adr_est_ind      VARCHAR2(30) := FND_API.G_MISS_CHAR,
        emp_at_primary_adr_min_ind      VARCHAR2(30) := FND_API.G_MISS_CHAR,
	high_credit			NUMBER := FND_API.G_MISS_NUM,
	avg_high_credit			NUMBER := FND_API.G_MISS_NUM,
	total_payments			NUMBER := FND_API.G_MISS_NUM,
        credit_score_class              NUMBER := FND_API.G_MISS_NUM,
        credit_score_natl_percentile    NUMBER := FND_API.G_MISS_NUM,
        credit_score_incd_default       NUMBER := FND_API.G_MISS_NUM,
        credit_score_age                NUMBER := FND_API.G_MISS_NUM,
        credit_score_date               DATE := FND_API.G_MISS_DATE,
        credit_score_commentary2        VARCHAR2(30) := FND_API.G_MISS_CHAR,
        credit_score_commentary3        VARCHAR2(30) := FND_API.G_MISS_CHAR,
        credit_score_commentary4        VARCHAR2(30) := FND_API.G_MISS_CHAR,
        credit_score_commentary5        VARCHAR2(30) := FND_API.G_MISS_CHAR,
        credit_score_commentary6        VARCHAR2(30) := FND_API.G_MISS_CHAR,
        credit_score_commentary7        VARCHAR2(30) := FND_API.G_MISS_CHAR,
        credit_score_commentary8        VARCHAR2(30) := FND_API.G_MISS_CHAR,
        credit_score_commentary9        VARCHAR2(30) := FND_API.G_MISS_CHAR,
        credit_score_commentary10       VARCHAR2(30) := FND_API.G_MISS_CHAR,
        failure_score_class             NUMBER := FND_API.G_MISS_NUM,
        failure_score_incd_default      NUMBER := FND_API.G_MISS_NUM,
        failure_score_age               NUMBER := FND_API.G_MISS_NUM,
        failure_score_date              DATE := FND_API.G_MISS_DATE,
        failure_score_commentary2       VARCHAR2(30) := FND_API.G_MISS_CHAR,
        failure_score_commentary3       VARCHAR2(30) := FND_API.G_MISS_CHAR,
        failure_score_commentary4       VARCHAR2(30) := FND_API.G_MISS_CHAR,
        failure_score_commentary5       VARCHAR2(30) := FND_API.G_MISS_CHAR,
        failure_score_commentary6       VARCHAR2(30) := FND_API.G_MISS_CHAR,
        failure_score_commentary7       VARCHAR2(30) := FND_API.G_MISS_CHAR,
        failure_score_commentary8       VARCHAR2(30) := FND_API.G_MISS_CHAR,
        failure_score_commentary9       VARCHAR2(30) := FND_API.G_MISS_CHAR,
        failure_score_commentary10      VARCHAR2(30) := FND_API.G_MISS_CHAR,
        maximum_credit_recommendation   NUMBER := FND_API.G_MISS_NUM,
        maximum_credit_currency_code    VARCHAR2(240) := FND_API.G_MISS_CHAR,
        displayed_duns_party_id         NUMBER := FND_API.G_MISS_NUM,
	content_source_type             VARCHAR2(30):= G_MISS_CONTENT_SOURCE_TYPE,
	content_source_number           VARCHAR2(30):= FND_API.G_MISS_CHAR,
	attribute_category              VARCHAR2(30):= FND_API.G_MISS_CHAR,
        attribute1                      VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute2                      VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute3                      VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute4                      VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute5                      VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute6                      VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute7                      VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute8                      VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute9                      VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute10                     VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute11                     VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute12                     VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute13                     VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute14                     VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute15                     VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute16                     VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute17                     VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute18                     VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute19                     VARCHAR2(150) := FND_API.G_MISS_CHAR,
        attribute20                     VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute_category       VARCHAR2(30) := FND_API.G_MISS_CHAR,
        global_attribute1               VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute2               VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute3               VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute4               VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute5               VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute6               VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute7               VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute8               VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute9               VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute10              VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute11              VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute12              VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute13              VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute14              VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute15              VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute16              VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute17              VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute18              VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute19              VARCHAR2(150) := FND_API.G_MISS_CHAR,
        global_attribute20              VARCHAR2(150) := FND_API.G_MISS_CHAR,
        wh_update_date                  DATE:= FND_API.G_MISS_DATE,
	party_rec			PARTY_REC_TYPE:= G_MISS_PARTY_REC
);

G_MISS_ORGANIZATION_REC		ORGANIZATION_REC_TYPE;

TYPE org_contact_rec_type IS RECORD(
	org_contact_id			NUMBER := FND_API.G_MISS_NUM,
	comments			VARCHAR2(240):=FND_API.G_MISS_CHAR,
	contact_number			VARCHAR2(30) := FND_API.G_MISS_CHAR,
	department_code			VARCHAR2(30) := FND_API.G_MISS_CHAR,
	department			VARCHAR2(60) := FND_API.G_MISS_CHAR,
	title				VARCHAR2(30) := FND_API.G_MISS_CHAR,
	job_title			VARCHAR2(100) :=FND_API.G_MISS_CHAR,
	mail_stop			VARCHAR2(60) := FND_API.G_MISS_CHAR,
	contact_key			VARCHAR2(50) := FND_API.G_MISS_CHAR,
	decision_maker_flag		VARCHAR2(1) := FND_API.G_MISS_CHAR,
	job_title_code			VARCHAR2(30) := FND_API.G_MISS_CHAR,
	managed_by			NUMBER  := FND_API.G_MISS_NUM,
	reference_use_flag		VARCHAR2(1) := FND_API.G_MISS_CHAR,
	rank				VARCHAR2(30) := FND_API.G_MISS_CHAR,
 	party_site_id			NUMBER := FND_API.G_MISS_NUM,
	orig_system_reference		VARCHAR2(240) := FND_API.G_MISS_CHAR,
	native_language			VARCHAR2(30) := FND_API.G_MISS_CHAR,
	other_language_1		VARCHAR2(30) := FND_API.G_MISS_CHAR,
	other_language_2		VARCHAR2(30) := FND_API.G_MISS_CHAR,
	mailing_address_id		NUMBER := FND_API.G_MISS_NUM,
	match_group_id			NUMBER := FND_API.G_MISS_NUM,
	status				VARCHAR2(1) := FND_API.G_MISS_CHAR,
	attribute_category		VARCHAR2(30):= FND_API.G_MISS_CHAR,
	attribute1			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute2			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute3			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute4			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute5			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute6			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute7			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute8			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute9			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute10			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute11			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute12			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute13			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute14			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute15			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute16			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute17			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute18			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute19			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute20			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute21			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute22			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute23			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute24			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute_category	VARCHAR2(30) := FND_API.G_MISS_CHAR,
	global_attribute1		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute2		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute3		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute4		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute5		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute6		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute7		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute8		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute9		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute10		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute11		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute12		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute13		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute14		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute15		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute16		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute17		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute18		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute19		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute20		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	wh_update_date			DATE:= FND_API.G_MISS_DATE,
	party_rel_rec			PARTY_REL_REC_TYPE:= G_MISS_PARTY_REL_REC
);


TYPE org_contact_role_rec_type IS RECORD(
	org_contact_role_id		NUMBER := FND_API.G_MISS_NUM,
	role_type			VARCHAR2(30) := FND_API.G_MISS_CHAR,
	primary_flag			VARCHAR2(1) := FND_API.G_MISS_CHAR,
	org_contact_id			NUMBER:= FND_API.G_MISS_NUM,
	orig_system_reference		VARCHAR2(240) := FND_API.G_MISS_CHAR,
	attribute_category		VARCHAR2(30):= FND_API.G_MISS_CHAR,
	attribute1			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute2			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute3			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute4			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute5			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute6			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute7			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute8			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute9			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute10			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute11			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute12			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute13			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute14			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute15			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	wh_update_date			DATE:= FND_API.G_MISS_DATE,
        role_level                      VARCHAR2(30):=FND_API.G_MISS_CHAR,
        primary_contact_per_role_type   VARCHAR2(1):= FND_API.G_MISS_CHAR,
        status                          VARCHAR2(1):=FND_API.G_MISS_CHAR
);



TYPE party_site_rec_type IS RECORD(
	party_site_id			NUMBER := FND_API.G_MISS_NUM,
	party_id			NUMBER:= FND_API.G_MISS_NUM,
	location_id			NUMBER:= FND_API.G_MISS_NUM,
	party_site_number		VARCHAR2(30) :=FND_API.G_MISS_CHAR,
	orig_system_reference		VARCHAR2(240) :=FND_API.G_MISS_CHAR,
	start_date_active		DATE := FND_API.G_MISS_DATE,
	end_date_active			DATE := FND_API.G_MISS_DATE,
	region				VARCHAR2(30) := FND_API.G_MISS_CHAR,
	mailstop			VARCHAR2(60) := FND_API.G_MISS_CHAR,
	customer_key_osm		VARCHAR2(255):= FND_API.G_MISS_CHAR,
	phone_key_osm			VARCHAR2(255):= FND_API.G_MISS_CHAR,
	contact_key_osm			VARCHAR2(255):= FND_API.G_MISS_CHAR,
	identifying_address_flag	VARCHAR2(1) := FND_API.G_MISS_CHAR,
	language			VARCHAR2(30):= FND_API.G_MISS_CHAR,
	status				VARCHAR2(1) := FND_API.G_MISS_CHAR,
	party_site_name			VARCHAR2(240) :=FND_API.G_MISS_CHAR,
	attribute_category		VARCHAR2(30):= FND_API.G_MISS_CHAR,
	attribute1			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute2			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute3			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute4			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute5			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute6			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute7			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute8			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute9			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute10			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute11			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute12			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute13			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute14			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute15			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute16			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute17			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute18			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute19			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	attribute20			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute_category	VARCHAR2(30) := FND_API.G_MISS_CHAR,
	global_attribute1		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute2		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute3		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute4		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute5		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute6		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute7		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute8		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute9		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute10		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute11		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute12		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute13		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute14		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute15		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute16		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute17		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute18		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute19		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	global_attribute20		VARCHAR2(150) := FND_API.G_MISS_CHAR,
	wh_update_date			DATE:= FND_API.G_MISS_DATE,
        ADDRESSEE 			VARCHAR2(150) := FND_API.G_MISS_CHAR,
	GLOBAL_LOCATION_NUMBER          VARCHAR2(40)  := FND_API.G_MISS_CHAR /* Bug 3175816 */
);


TYPE party_site_use_rec_type IS RECORD(
	party_site_use_id               NUMBER := FND_API.G_MISS_NUM,
	begin_date		        DATE :=FND_API.G_MISS_DATE,
	comments		        VARCHAR2(240):= FND_API.G_MISS_CHAR,
	end_date		        DATE := FND_API.G_MISS_DATE,
	site_use_type		        VARCHAR2(30):= FND_API.G_MISS_CHAR,
	party_site_id		        NUMBER:= FND_API.G_MISS_NUM,
	wh_update_date		        DATE:= FND_API.G_MISS_DATE,
	primary_per_type	        VARCHAR2(1) :=FND_API.G_MISS_CHAR,
        status                          VARCHAR2(1) := FND_API.G_MISS_CHAR
);


-------------------------------------------------------------------------
procedure create_person (
	p_api_version	            IN      NUMBER,
	p_init_msg_list		    IN	    VARCHAR2:= FND_API.G_FALSE,
	p_commit		    IN	    VARCHAR2:= FND_API.G_FALSE,
	p_person_rec		    IN	    PERSON_REC_TYPE,
	x_return_status		    OUT     VARCHAR2,
        x_msg_count                 OUT     NUMBER,
	x_msg_data		    OUT     VARCHAR2,
	x_party_id		    OUT     NUMBER,
	x_party_number              OUT     VARCHAR2,
        x_profile_id                OUT     NUMBER,
        p_validation_level          IN      NUMBER:= FND_API.G_VALID_LEVEL_FULL
);

procedure update_person (
	p_api_version	            IN      NUMBER,
	p_init_msg_list		    IN      VARCHAR2:= FND_API.G_FALSE,
	p_commit		    IN      VARCHAR2:= FND_API.G_FALSE,
	p_person_rec		    IN      PERSON_REC_TYPE,
	p_party_last_update_date    IN OUT  DATE,
	x_profile_id                OUT     NUMBER,
	x_return_status	            OUT     VARCHAR2,
	x_msg_count		    OUT     NUMBER,
	x_msg_data		    OUT     VARCHAR2,
        p_validation_level          IN      NUMBER:= FND_API.G_VALID_LEVEL_FULL
);

procedure create_group (
	p_api_version	            IN	    NUMBER,
	p_init_msg_list		    IN	    VARCHAR2:= FND_API.G_FALSE,
	p_commit		    IN	    VARCHAR2:= FND_API.G_FALSE,
  	p_group_rec	            IN	    GROUP_REC_TYPE,
	x_return_status		    OUT	    VARCHAR2,
	x_msg_count		    OUT	    NUMBER,
	x_msg_data		    OUT	    VARCHAR2,
	x_party_id		    OUT	    NUMBER,
	x_party_number              OUT     VARCHAR2,
        p_validation_level          IN      NUMBER:= FND_API.G_VALID_LEVEL_FULL
);

procedure update_group (
	p_api_version		    IN 	    NUMBER,
	p_init_msg_list		    IN      VARCHAR2:= FND_API.G_FALSE,
	p_commit		    IN 	    VARCHAR2:= FND_API.G_FALSE,
	p_group_rec		    IN 	    GROUP_REC_TYPE,
	p_party_last_update_date    IN OUT  DATE,
	x_return_status		    OUT	    VARCHAR2,
	x_msg_count		    OUT	    NUMBER,
	x_msg_data		    OUT	    VARCHAR2,
        p_validation_level          IN      NUMBER:= FND_API.G_VALID_LEVEL_FULL
);


procedure create_party_relationship (
	p_api_version	            IN	    NUMBER,
	p_init_msg_list		    IN	    VARCHAR2:= FND_API.G_FALSE,
	p_commit		    IN	    VARCHAR2:= FND_API.G_FALSE,
  	p_party_rel_rec		    IN	    PARTY_REL_REC_TYPE,
	p_create_party		    IN	    VARCHAR2:= 'N',
	x_return_status		    OUT	    VARCHAR2,
	x_msg_count		    OUT	    NUMBER,
	x_msg_data		    OUT	    VARCHAR2,
	x_party_relationship_id	    OUT	    NUMBER,
	x_party_id		    OUT	    NUMBER,
	x_party_number              OUT     VARCHAR2,
        p_validation_level          IN      NUMBER:= FND_API.G_VALID_LEVEL_FULL

);

procedure update_party_relationship (
	p_api_version		    IN      NUMBER,
	p_init_msg_list		    IN 	    VARCHAR2:= FND_API.G_FALSE,
	p_commit		    IN 	    VARCHAR2:= FND_API.G_FALSE,
	p_party_rel_rec		    IN 	    PARTY_REL_REC_TYPE,
	p_party_rel_last_update_date IN OUT DATE,
	p_party_last_update_date    IN OUT  DATE,
	x_return_status		    OUT	    VARCHAR2,
	x_msg_count		    OUT	    NUMBER,
	x_msg_data		    OUT	    VARCHAR2,
        p_validation_level          IN      NUMBER:= FND_API.G_VALID_LEVEL_FULL
);


procedure create_organization (
	p_api_version	            IN 	    NUMBER,
	p_init_msg_list		    IN 	    VARCHAR2:= FND_API.G_FALSE,
	p_commit		    IN 	    VARCHAR2:= FND_API.G_FALSE,
	p_organization_rec	    IN	    organization_rec_type,
	x_return_status		    OUT	    VARCHAR2,
	x_msg_count		    OUT	    NUMBER,
	x_msg_data		    OUT	    VARCHAR2,
	x_party_id		    OUT	    NUMBER,
	x_party_number              OUT     VARCHAR2,
        x_profile_id                OUT     NUMBER,
        p_validation_level          IN      NUMBER:= FND_API.G_VALID_LEVEL_FULL

);

procedure update_organization (
	p_api_version		    IN	    NUMBER,
	p_init_msg_list	            IN	    VARCHAR2:= FND_API.G_FALSE,
	p_commit		    IN	    VARCHAR2:= FND_API.G_FALSE,
	p_organization_rec	    IN	    ORGANIZATION_REC_TYPE,
	p_party_last_update_date    IN OUT  DATE,
	x_profile_id                OUT     NUMBER,
	x_return_status	            OUT	    VARCHAR2,
	x_msg_count		    OUT     NUMBER,
	x_msg_data		    OUT	    VARCHAR2,
        p_validation_level          IN      NUMBER:= FND_API.G_VALID_LEVEL_FULL

);


procedure create_org_contact (
	p_api_version	            IN	    NUMBER,
	p_init_msg_list		    IN	    VARCHAR2:= FND_API.G_FALSE,
	p_commit		    IN	    VARCHAR2:= FND_API.G_FALSE,
	p_org_contact_rec	    IN	    ORG_CONTACT_REC_TYPE,
	x_return_status		    OUT     VARCHAR2,
	x_msg_count		    OUT     NUMBER,
	x_msg_data		    OUT     VARCHAR2,
	x_org_contact_id	    OUT     NUMBER,
	x_party_rel_id		    OUT     NUMBER,
	x_party_id		    OUT     NUMBER,
	x_party_number		    OUT     VARCHAR2,
        p_validation_level          IN      NUMBER:= FND_API.G_VALID_LEVEL_FULL
);

procedure update_org_contact (
	p_api_version		    IN	    NUMBER,
	p_init_msg_list		    IN	    VARCHAR2:= FND_API.G_FALSE,
	p_commit		    IN	    VARCHAR2:= FND_API.G_FALSE,
	p_org_contact_rec	    IN	    ORG_CONTACT_REC_TYPE,
	p_org_contact_last_update_date IN OUT  DATE,
	p_party_rel_last_update_date   IN OUT  DATE,
	p_party_last_update_date    IN OUT  DATE,
	x_return_status		    OUT	    VARCHAR2,
	x_msg_count		    OUT	    NUMBER,
	x_msg_data		    OUT	    VARCHAR2,
        p_validation_level          IN      NUMBER:= FND_API.G_VALID_LEVEL_FULL

);


procedure create_org_contact_role (
	p_api_version	            IN	    NUMBER,
	p_init_msg_list		    IN	    VARCHAR2:= FND_API.G_FALSE,
	p_commit		    IN	    VARCHAR2:= FND_API.G_FALSE,
	p_org_contact_role_rec	    IN	    ORG_CONTACT_ROLE_REC_TYPE,
	x_return_status		    OUT     VARCHAR2,
	x_msg_count		    OUT     NUMBER,
	x_msg_data		    OUT     VARCHAR2,
	x_org_contact_role_id	    OUT     NUMBER,
        p_validation_level          IN      NUMBER:= FND_API.G_VALID_LEVEL_FULL
);

procedure update_org_contact_role (
	p_api_version	            IN	    NUMBER,
	p_init_msg_list		    IN	    VARCHAR2:= FND_API.G_FALSE,
	p_commit		    IN	    VARCHAR2:= FND_API.G_FALSE,
	p_org_contact_role_rec	    IN	    ORG_CONTACT_ROLE_REC_TYPE,
	p_last_update_date	    IN OUT  DATE,
	x_return_status		    OUT     VARCHAR2,
	x_msg_count		    OUT     NUMBER,
	x_msg_data		    OUT     VARCHAR2,
        p_validation_level          IN      NUMBER:= FND_API.G_VALID_LEVEL_FULL
);


procedure create_party_site (
	p_api_version 	            IN	    NUMBER,
	p_init_msg_list	            IN	    VARCHAR2:=FND_API.G_FALSE,
	p_commit	            IN	    VARCHAR2:=FND_API.G_FALSE,
	p_party_site_rec            IN	    PARTY_SITE_REC_TYPE,
	x_return_status	            OUT     VARCHAR2,
	x_msg_count		    OUT	    NUMBER,
	x_msg_data		    OUT	    VARCHAR2,
	x_party_site_id		    OUT	    NUMBER,
	x_party_site_number	    OUT	    VARCHAR2,
        p_validation_level          IN      NUMBER:= FND_API.G_VALID_LEVEL_FULL
);

procedure update_party_site (
	p_api_version		    IN	    NUMBER,
	p_init_msg_list		    IN	    VARCHAR2:= FND_API.G_FALSE,
	p_commit		    IN	    VARCHAR2:= FND_API.G_FALSE,
	p_party_site_rec	    IN	    PARTY_SITE_REC_TYPE,
	p_last_update_date	    IN OUT  DATE,
	x_return_status		    OUT	    VARCHAR2,
	x_msg_count		    OUT	    NUMBER,
	x_msg_data		    OUT     VARCHAR2,
        p_validation_level          IN      NUMBER:= FND_API.G_VALID_LEVEL_FULL
);


procedure create_party_site_use (
	p_api_version	            IN	    NUMBER,
	p_init_msg_list		    IN	    VARCHAR2:= FND_API.G_FALSE,
	p_commit		    IN	    VARCHAR2:= FND_API.G_FALSE,
	p_party_site_use_rec	    IN	    party_site_use_rec_type,
	x_return_status		    OUT	    VARCHAR2,
	x_msg_count		    OUT	    NUMBER,
	x_msg_data		    OUT	    VARCHAR2,
	x_party_site_use_id	    OUT	    NUMBER,
        p_validation_level          IN      NUMBER:= FND_API.G_VALID_LEVEL_FULL
);

procedure update_party_site_use (
	p_api_version	            IN	    NUMBER,
	p_init_msg_list		    IN	    VARCHAR2:= FND_API.G_FALSE,
	p_commit		    IN	    VARCHAR2:= FND_API.G_FALSE,
	p_party_site_use_rec	    IN	    PARTY_SITE_USE_REC_TYPE,
	p_last_update_date	    IN OUT  DATE,
	x_return_status		    OUT	    VARCHAR2,
	x_msg_count		    OUT	    NUMBER,
	x_msg_data		    OUT	    VARCHAR2,
        p_validation_level          IN      NUMBER:= FND_API.G_VALID_LEVEL_FULL
);


procedure do_create_party(
        p_party_type                IN      VARCHAR2,
        p_person_rec                IN OUT  PERSON_REC_TYPE,
        p_organization_rec          IN OUT  ORGANIZATION_REC_TYPE,
        p_group_rec                 IN OUT  GROUP_REC_TYPE,
        p_party_rel_rec             IN OUT  PARTY_REL_REC_TYPE,
        x_party_id                  OUT     NUMBER,
	x_party_number              OUT     VARCHAR2,
        x_profile_id                OUT     NUMBER,
	x_return_status		    IN OUT  VARCHAR2
);

procedure do_update_party(
        p_party_type                    IN      VARCHAR2,
        p_person_rec                    IN OUT  PERSON_REC_TYPE,
        p_organization_rec              IN OUT  ORGANIZATION_REC_TYPE,
        p_group_rec                     IN OUT  GROUP_REC_TYPE,
        p_party_rel_rec                 IN OUT  PARTY_REL_REC_TYPE,
        p_party_last_update_date        IN OUT  DATE,
        x_profile_id                    OUT     NUMBER,
        x_return_status                 IN OUT  VARCHAR2
);

procedure do_create_party_rel(
        p_party_rel_rec             IN OUT  PARTY_REL_REC_TYPE,
        p_create_party              IN      VARCHAR2,
        x_party_relationship_id     OUT     NUMBER,
        x_party_id                  OUT     NUMBER,
	x_party_number	            OUT	    VARCHAR2,
	x_return_status             IN OUT  VARCHAR2
);

procedure do_create_org_contact(
        p_org_contact_rec           IN OUT  ORG_CONTACT_REC_TYPE,
        x_org_contact_id            OUT     NUMBER,
	x_party_rel_id              OUT     NUMBER,
        x_party_id                  OUT     NUMBER,
	x_party_number              OUT     VARCHAR2,
	x_return_status             IN OUT  VARCHAR2
);

procedure do_create_party_site(
        p_party_site_rec            IN OUT  PARTY_SITE_REC_TYPE,
        x_party_site_id             OUT     NUMBER,
	x_party_site_number         OUT     VARCHAR2,
	x_return_status             IN OUT  VARCHAR2
);

--
-- A new procedure, do_create_org, has been created as a Public procedure as a part of DNB integration
-- requirement. This MUST NOT be called by anything else. To create an organization, Public procedure
-- HZ_PARTY_PUB.create_party must be called.
--
-- When DNB data is fetched for a party existing in the system i.e. in HZ_PARTIES table,
-- the DNB data needs to be stored only in HZ_ORGANIZATION_PROFILES table. The current procedure
-- (HZ_PARTY_PUB.create_party) does not satisfy this requirement as this also insertes into HZ_PARTIES.
-- Therefore, the need for this new procedure which only inserts into HZ_ORGANIZATION_PROFILES for an
-- existing party.
--

procedure do_create_org(
        p_init_msg_list         IN      VARCHAR2:= FND_API.G_FALSE,
        p_commit                IN      VARCHAR2:= FND_API.G_FALSE,
        p_organization_rec      IN      ORGANIZATION_REC_TYPE,
        x_return_status         IN OUT     VARCHAR2,
        x_msg_count             OUT     NUMBER,
        x_msg_data              OUT     VARCHAR2,
        x_profile_id            OUT     NUMBER,
        p_validation_level      IN      NUMBER:= FND_API.G_VALID_LEVEL_FULL
);

/* Bug 1386757: MAKING THE "GET_" METHODS IN HZ_PARTY_PUB PUBLIC */

procedure get_current_party(
        p_api_version   	IN      NUMBER,
        p_init_msg_list         IN      VARCHAR2:= FND_API.G_FALSE,
        p_party_id              IN      NUMBER,
        x_party_rec             OUT     PARTY_REC_TYPE,
        x_return_status         IN OUT     VARCHAR2,
        x_msg_count             OUT     NUMBER,
        x_msg_data              OUT     VARCHAR2
);

procedure get_current_party_site(
        p_api_version   	IN      NUMBER,
        p_init_msg_list         IN      VARCHAR2:= FND_API.G_FALSE,
        p_party_site_id         IN      NUMBER,
        x_party_site_rec        OUT     PARTY_SITE_REC_TYPE,
        x_return_status         IN OUT     VARCHAR2,
        x_msg_count             OUT     NUMBER,
        x_msg_data              OUT     VARCHAR2
);

procedure get_current_party_rel(
        p_api_version   	IN      NUMBER,
        p_init_msg_list         IN      VARCHAR2:= FND_API.G_FALSE,
        p_party_rel_id          IN      NUMBER,
        x_party_rel_rec         OUT     PARTY_REL_REC_TYPE,
        x_return_status         IN OUT  VARCHAR2,
        x_msg_count             OUT     NUMBER,
        x_msg_data              OUT     VARCHAR2
);

procedure get_current_org_contact(
        p_api_version   	IN      NUMBER,
        p_init_msg_list         IN      VARCHAR2:= FND_API.G_FALSE,
        p_org_contact_id        IN      NUMBER,
        x_org_contact_rec       OUT     ORG_CONTACT_REC_TYPE,
        x_return_status         IN OUT     VARCHAR2,
        x_msg_count             OUT     NUMBER,
        x_msg_data              OUT     VARCHAR2
);


procedure get_current_org(
	p_api_version           IN      NUMBER,
        p_init_msg_list         IN      VARCHAR2:= FND_API.G_FALSE,
        p_profile_id        	IN      NUMBER,
        x_org_rec               OUT     ORGANIZATION_REC_TYPE,
	x_return_status         IN OUT     VARCHAR2,
        x_msg_count             OUT     NUMBER,
        x_msg_data              OUT     VARCHAR2
);

-- do_copy_duns_number made public for V1/V2 purpose
procedure do_copy_duns_number(
        p_duns_number                   IN OUT  NUMBER,
        p_duns_number_c                 IN OUT  VARCHAR2
);

END HZ_PARTY_PUB;
/
