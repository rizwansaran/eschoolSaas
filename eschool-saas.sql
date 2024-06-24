CREATE TABLE `academic_calendars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `title` varchar(512) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `session_year_id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `price` double(8,4) NOT NULL COMMENT 'Daily price',
  `feature_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 => Inactive, 1 => Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addon_subscriptions`
--

CREATE TABLE `addon_subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `feature_id` bigint(20) UNSIGNED NOT NULL,
  `price` double(8,4) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 => Discontinue next billing, 1 => Continue',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(128) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `session_year_id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcement_classes`
--

CREATE TABLE `announcement_classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `announcement_id` bigint(20) UNSIGNED DEFAULT NULL,
  `class_section_id` bigint(20) UNSIGNED DEFAULT NULL,
  `class_subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_section_id` bigint(20) UNSIGNED NOT NULL,
  `class_subject_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `instructions` varchar(1024) DEFAULT NULL,
  `due_date` datetime NOT NULL,
  `points` int(11) DEFAULT NULL,
  `resubmission` tinyint(1) NOT NULL DEFAULT 0,
  `extra_days_for_resubmission` int(11) DEFAULT NULL,
  `session_year_id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL COMMENT 'teacher_user_id',
  `edited_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'teacher_user_id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assignment_submissions`
--

CREATE TABLE `assignment_submissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `assignment_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `session_year_id` bigint(20) UNSIGNED NOT NULL,
  `feedback` text DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = Pending/In Review , 1 = Accepted , 2 = Rejected , 3 = Resubmitted',
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_section_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL COMMENT 'user_id',
  `session_year_id` bigint(20) UNSIGNED NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '0=Absent, 1=Present',
  `date` date NOT NULL,
  `remark` varchar(512) NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(512) NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(512) NOT NULL,
  `include_semesters` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 - no 1 - yes',
  `medium_id` bigint(20) UNSIGNED NOT NULL,
  `shift_id` bigint(20) UNSIGNED DEFAULT NULL,
  `stream_id` bigint(20) UNSIGNED DEFAULT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `class_sections`
--

CREATE TABLE `class_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `medium_id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `class_subjects`
--

CREATE TABLE `class_subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(32) NOT NULL COMMENT 'Compulsory / Elective',
  `elective_subject_group_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'if type=Elective',
  `semester_id` bigint(20) UNSIGNED DEFAULT NULL,
  `virtual_semester_id` int(11) GENERATED ALWAYS AS (case when `semester_id` is not null then `semester_id` else 0 end) VIRTUAL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `class_teachers`
--

CREATE TABLE `class_teachers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_section_id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL COMMENT 'user_id',
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `compulsory_fees`
--

CREATE TABLE `compulsory_fees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL COMMENT 'user_id',
  `payment_transaction_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` enum('Full Payment','Installment Payment') NOT NULL,
  `installment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `mode` enum('Cash','Cheque','Online') NOT NULL,
  `cheque_no` varchar(191) DEFAULT NULL,
  `amount` double(8,2) NOT NULL,
  `due_charges` double(8,2) DEFAULT NULL,
  `fees_paid_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('Success','Pending','Failed') NOT NULL,
  `date` date NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `elective_subject_groups`
--

CREATE TABLE `elective_subject_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `total_subjects` int(11) NOT NULL,
  `total_selectable_subjects` int(11) NOT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `semester_id` bigint(20) UNSIGNED DEFAULT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `session_year_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `publish` tinyint(4) NOT NULL DEFAULT 0,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_marks`
--

CREATE TABLE `exam_marks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `exam_timetable_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL COMMENT 'user_id',
  `class_subject_id` bigint(20) UNSIGNED NOT NULL,
  `obtained_marks` double(8,2) NOT NULL,
  `teacher_review` varchar(1024) DEFAULT NULL,
  `passing_status` tinyint(1) NOT NULL COMMENT '1=Pass, 0=Fail',
  `session_year_id` bigint(20) UNSIGNED NOT NULL,
  `grade` tinytext DEFAULT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_results`
--

CREATE TABLE `exam_results` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `exam_id` bigint(20) UNSIGNED NOT NULL,
  `class_section_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL COMMENT 'user_id',
  `total_marks` int(11) NOT NULL,
  `obtained_marks` double(8,2) NOT NULL,
  `percentage` double(8,2) NOT NULL,
  `grade` tinytext NOT NULL,
  `session_year_id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_timetables`
--

CREATE TABLE `exam_timetables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `exam_id` bigint(20) UNSIGNED NOT NULL,
  `class_subject_id` bigint(20) UNSIGNED NOT NULL,
  `total_marks` double(8,2) NOT NULL,
  `passing_marks` double(8,2) NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `session_year_id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ref_no` varchar(191) DEFAULT NULL,
  `staff_id` bigint(20) UNSIGNED DEFAULT NULL,
  `basic_salary` bigint(20) NOT NULL DEFAULT 0,
  `paid_leaves` double(8,2) NOT NULL DEFAULT 0.00,
  `month` bigint(20) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `title` varchar(512) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `amount` double(8,2) NOT NULL,
  `date` date NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `session_year_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `extra_student_datas`
--

CREATE TABLE `extra_student_datas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL COMMENT 'user_id',
  `form_field_id` bigint(20) UNSIGNED NOT NULL,
  `data` text DEFAULT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 => No, 1 => Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `name`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Student Management', 1, '2023-11-25 08:38:41', '2023-11-25 08:38:41'),
(2, 'Academics Management', 1, '2023-11-25 08:38:41', '2023-11-25 08:38:41'),
(3, 'Slider Management', 0, '2023-11-25 08:38:41', '2023-11-25 08:38:41'),
(4, 'Teacher Management', 1, '2023-11-25 08:38:41', '2023-11-25 08:38:41'),
(5, 'Session Year Management', 1, '2023-11-25 08:38:41', '2023-11-25 08:38:41'),
(6, 'Holiday Management', 0, '2023-11-25 08:38:41', '2023-11-25 08:38:41'),
(7, 'Timetable Management', 0, '2023-11-25 08:38:41', '2023-11-25 08:38:41'),
(8, 'Attendance Management', 0, '2023-11-25 08:38:41', '2023-11-25 08:38:41'),
(9, 'Exam Management', 0, '2023-11-25 08:38:41', '2023-11-25 08:38:41'),
(10, 'Lesson Management', 0, '2023-11-25 08:38:41', '2023-11-25 08:38:41'),
(11, 'Assignment Management', 0, '2023-11-25 08:38:41', '2023-11-25 08:38:41'),
(12, 'Announcement Management', 0, '2023-11-25 08:38:41', '2023-11-25 08:38:41'),
(13, 'Staff Management', 0, '2023-11-25 08:38:41', '2023-11-25 08:38:41'),
(14, 'Expense Management', 0, '2023-11-25 08:38:41', '2023-11-25 08:38:41'),
(15, 'Staff Leave Management', 0, '2024-02-15 20:56:33', '2024-02-15 20:56:33'),
(16, 'Fees Management', 0, '2024-02-15 20:56:33', '2024-02-15 20:56:33');

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `due_date` date NOT NULL,
  `due_charges` double(8,2) NOT NULL COMMENT 'in percentage (%)',
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `session_year_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fees_advance`
--

CREATE TABLE `fees_advance` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `compulsory_fee_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL COMMENT 'user_id',
  `parent_id` bigint(20) UNSIGNED NOT NULL COMMENT 'user_id',
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fees_class_types`
--

CREATE TABLE `fees_class_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `fees_id` bigint(20) UNSIGNED NOT NULL,
  `fees_type_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double(8,2) NOT NULL,
  `optional` tinyint(1) NOT NULL COMMENT '0 - No, 1 - Yes',
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fees_installments`
--

CREATE TABLE `fees_installments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `due_date` date NOT NULL,
  `due_charges` int(11) NOT NULL COMMENT 'in percentage (%)',
  `fees_id` bigint(20) UNSIGNED NOT NULL,
  `session_year_id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fees_paids`
--

CREATE TABLE `fees_paids` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fees_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL COMMENT 'user_id',
  `is_fully_paid` tinyint(1) NOT NULL COMMENT '0 - No, 1 - Yes',
  `is_used_installment` tinyint(1) NOT NULL COMMENT '0 - No, 1 - Yes',
  `amount` double(8,2) NOT NULL,
  `date` date NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fees_types`
--

CREATE TABLE `fees_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `modal_type` varchar(191) NOT NULL,
  `modal_id` bigint(20) UNSIGNED NOT NULL,
  `file_name` varchar(1024) DEFAULT NULL,
  `file_thumbnail` varchar(1024) DEFAULT NULL,
  `type` tinytext NOT NULL COMMENT '1 = File Upload, 2 = Youtube Link, 3 = Video Upload, 4 = Other Link',
  `file_url` varchar(1024) NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `form_fields`
--

CREATE TABLE `form_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `type` varchar(128) NOT NULL COMMENT 'text,number,textarea,dropdown,checkbox,radio,fileupload',
  `is_required` tinyint(1) NOT NULL DEFAULT 0,
  `default_values` text DEFAULT NULL COMMENT 'values of radio,checkbox,dropdown,etc',
  `other` text DEFAULT NULL COMMENT 'extra HTML attributes',
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `rank` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `starting_range` double(8,2) NOT NULL,
  `ending_range` double(8,2) NOT NULL,
  `grade` tinytext NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guidances`
--

CREATE TABLE `guidances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `link` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `title` varchar(128) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(512) NOT NULL,
  `code` varchar(64) NOT NULL,
  `file` varchar(512) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=>active',
  `is_rtl` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `file`, `status`, `is_rtl`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 'en.json', 1, 0, '2023-11-25 08:38:41', '2023-11-25 08:38:41');

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `reason` varchar(191) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0 => Pending, 1 => Approved, 2 => Rejected',
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `leave_master_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_details`
--

CREATE TABLE `leave_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `leave_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `type` varchar(191) NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_masters`
--

CREATE TABLE `leave_masters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `leaves` double(8,2) NOT NULL COMMENT 'Leaves per month',
  `holiday` varchar(191) NOT NULL,
  `session_year_id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(512) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `class_section_id` bigint(20) UNSIGNED NOT NULL,
  `class_subject_id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lesson_topics`
--

CREATE TABLE `lesson_topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lesson_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mediums`
--

CREATE TABLE `mediums` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(512) NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_04_01_091033_create_permission_tables', 1),
(6, '2022_04_01_105826_all_tables', 1),
(7, '2023_11_16_134449_version1-0-1', 1),
(8, '2023_12_07_120054_version1_1_0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `online_exams`
--

CREATE TABLE `online_exams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_section_id` bigint(20) UNSIGNED NOT NULL,
  `class_subject_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(128) NOT NULL,
  `exam_key` bigint(20) NOT NULL,
  `duration` int(11) NOT NULL COMMENT 'in minutes',
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `session_year_id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_questions`
--

CREATE TABLE `online_exam_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_section_id` bigint(20) UNSIGNED NOT NULL,
  `class_subject_id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(1024) NOT NULL,
  `image_url` varchar(1024) DEFAULT NULL,
  `note` varchar(1024) DEFAULT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `last_edited_by` bigint(20) UNSIGNED NOT NULL COMMENT 'teacher_user_id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_question_choices`
--

CREATE TABLE `online_exam_question_choices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `online_exam_id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `marks` int(11) DEFAULT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_question_options`
--

CREATE TABLE `online_exam_question_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `option` varchar(1024) NOT NULL,
  `is_answer` tinyint(4) NOT NULL COMMENT '1 - yes, 0 - no',
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_student_answers`
--

CREATE TABLE `online_exam_student_answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL COMMENT 'user_id',
  `online_exam_id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `submitted_date` date NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `optional_fees`
--

CREATE TABLE `optional_fees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL COMMENT 'user_id',
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `payment_transaction_id` bigint(20) UNSIGNED DEFAULT NULL,
  `fees_class_id` bigint(20) UNSIGNED DEFAULT NULL,
  `mode` enum('Cash','Cheque','Online') NOT NULL,
  `cheque_no` varchar(191) DEFAULT NULL,
  `amount` double(8,2) NOT NULL,
  `fees_paid_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` date NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('Success','Pending','Failed') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `tagline` varchar(191) DEFAULT NULL,
  `student_charge` double(8,4) NOT NULL DEFAULT 0.0000,
  `staff_charge` double(8,4) NOT NULL DEFAULT 0.0000,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 => Unpublished, 1 => Published',
  `is_trial` int(11) NOT NULL DEFAULT 0,
  `highlight` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 => No, 1 => Yes',
  `rank` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `package_features`
--

CREATE TABLE `package_features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `feature_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_configurations`
--

CREATE TABLE `payment_configurations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_method` varchar(191) NOT NULL,
  `api_key` varchar(191) NOT NULL,
  `secret_key` varchar(191) NOT NULL,
  `webhook_secret_key` varchar(191) NOT NULL,
  `currency_code` varchar(128) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 - Disabled, 1 - Enabled',
  `school_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_transactions`
--

CREATE TABLE `payment_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double(8,2) NOT NULL,
  `payment_gateway` varchar(191) NOT NULL,
  `order_id` varchar(191) DEFAULT NULL COMMENT 'order_id / payment_intent_id',
  `payment_id` varchar(191) DEFAULT NULL,
  `payment_signature` varchar(191) DEFAULT NULL,
  `payment_status` enum('failed','succeed','pending') NOT NULL,
  `school_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'role-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(2, 'role-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(3, 'role-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(4, 'role-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(5, 'medium-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(6, 'medium-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(7, 'medium-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(8, 'medium-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(9, 'section-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(10, 'section-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(11, 'section-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(12, 'section-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(13, 'class-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(14, 'class-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(15, 'class-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(16, 'class-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(17, 'class-section-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(18, 'class-section-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(19, 'class-section-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(20, 'class-section-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(21, 'subject-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(22, 'subject-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(23, 'subject-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(24, 'subject-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(25, 'teacher-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(26, 'teacher-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(27, 'teacher-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(28, 'teacher-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(29, 'guardian-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(30, 'guardian-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(31, 'guardian-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(32, 'guardian-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(33, 'session-year-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(34, 'session-year-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(35, 'session-year-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(36, 'session-year-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(37, 'student-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(38, 'student-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(39, 'student-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(40, 'student-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(41, 'timetable-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(42, 'timetable-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(43, 'timetable-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(44, 'timetable-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(45, 'attendance-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(46, 'attendance-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(47, 'attendance-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(48, 'attendance-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(49, 'holiday-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(50, 'holiday-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(51, 'holiday-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(52, 'holiday-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(53, 'announcement-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(54, 'announcement-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(55, 'announcement-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(56, 'announcement-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(57, 'slider-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(58, 'slider-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(59, 'slider-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(60, 'slider-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(61, 'promote-student-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(62, 'promote-student-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(63, 'promote-student-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(64, 'promote-student-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(65, 'language-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(66, 'language-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(67, 'language-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(68, 'language-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(69, 'lesson-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(70, 'lesson-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(71, 'lesson-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(72, 'lesson-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(73, 'topic-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(74, 'topic-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(75, 'topic-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(76, 'topic-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(77, 'schools-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(78, 'schools-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(79, 'schools-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(80, 'schools-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(81, 'form-fields-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(82, 'form-fields-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(83, 'form-fields-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(84, 'form-fields-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(85, 'grade-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(86, 'grade-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(87, 'grade-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(88, 'grade-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(89, 'package-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(90, 'package-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(91, 'package-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(92, 'package-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(93, 'addons-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(94, 'addons-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(95, 'addons-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(96, 'addons-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(97, 'assignment-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(98, 'assignment-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(99, 'assignment-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(100, 'assignment-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(101, 'assignment-submission', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(102, 'exam-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(103, 'exam-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(104, 'exam-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(105, 'exam-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(106, 'exam-timetable-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(107, 'exam-timetable-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(108, 'exam-timetable-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(109, 'exam-timetable-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(110, 'exam-upload-marks', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(111, 'exam-result', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(112, 'system-setting-manage', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(113, 'fcm-setting-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(114, 'email-setting-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(115, 'privacy-policy', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(116, 'contact-us', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(117, 'about-us', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(118, 'terms-condition', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(119, 'class-teacher', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(120, 'student-reset-password', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(121, 'reset-password-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(122, 'student-change-password', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(123, 'update-admin-profile', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(124, 'fees-classes', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(125, 'fees-paid', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(126, 'fees-config', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(127, 'school-setting-manage', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(128, 'app-settings', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(129, 'subscription-view', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(130, 'online-exam-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(131, 'online-exam-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(132, 'online-exam-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(133, 'online-exam-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(134, 'online-exam-questions-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(135, 'online-exam-questions-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(136, 'online-exam-questions-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(137, 'online-exam-questions-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(138, 'fees-type-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(139, 'fees-type-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(140, 'fees-type-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(141, 'fees-type-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(142, 'fees-class-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(143, 'fees-class-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(144, 'fees-class-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(145, 'fees-class-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(146, 'staff-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(147, 'staff-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(148, 'staff-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(149, 'staff-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(150, 'expense-category-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(151, 'expense-category-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(152, 'expense-category-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(153, 'expense-category-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(154, 'expense-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(155, 'expense-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(156, 'expense-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(157, 'expense-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(158, 'semester-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(159, 'semester-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(160, 'semester-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(161, 'semester-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(162, 'payroll-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(163, 'payroll-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(164, 'payroll-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(165, 'payroll-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(166, 'stream-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(167, 'stream-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(168, 'stream-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(169, 'stream-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(170, 'shift-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(171, 'shift-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(172, 'shift-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(173, 'shift-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(174, 'faqs-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(175, 'faqs-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(176, 'faqs-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(177, 'faqs-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(178, 'online-exam-result-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(179, 'fcm-setting-manage', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(180, 'fees-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(181, 'fees-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(182, 'fees-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(183, 'fees-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(184, 'transfer-student-list', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(185, 'transfer-student-create', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(186, 'transfer-student-edit', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(187, 'transfer-student-delete', 'web', '2023-11-25 08:38:41', '2024-02-15 20:56:33'),
(188, 'guidance-list', 'web', '2024-02-15 20:56:33', '2024-02-15 20:56:33'),
(189, 'guidance-create', 'web', '2024-02-15 20:56:33', '2024-02-15 20:56:33'),
(190, 'guidance-edit', 'web', '2024-02-15 20:56:33', '2024-02-15 20:56:33'),
(191, 'guidance-delete', 'web', '2024-02-15 20:56:33', '2024-02-15 20:56:33'),
(192, 'leave-list', 'web', '2024-02-15 20:56:33', '2024-02-15 20:56:33'),
(193, 'leave-create', 'web', '2024-02-15 20:56:33', '2024-02-15 20:56:33'),
(194, 'leave-edit', 'web', '2024-02-15 20:56:33', '2024-02-15 20:56:33'),
(195, 'leave-delete', 'web', '2024-02-15 20:56:33', '2024-02-15 20:56:33'),
(196, 'approve-leave', 'web', '2024-02-15 20:56:33', '2024-02-15 20:56:33'),
(197, 'front-site-setting', 'web', '2024-02-15 20:56:33', '2024-02-15 20:56:33'),
(198, 'payment-settings', 'web', '2024-02-15 20:56:33', '2024-02-15 20:56:33'),
(199, 'subscription-settings', 'web', '2024-02-15 20:56:33', '2024-02-15 20:56:33'),
(200, 'subscription-change-bills', 'web', '2024-02-15 20:56:33', '2024-02-15 20:56:33'),
(201, 'school-terms-condition', 'web', '2024-02-15 20:56:33', '2024-02-15 20:56:33');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promote_students`
--

CREATE TABLE `promote_students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL COMMENT 'user_id',
  `class_section_id` bigint(20) UNSIGNED NOT NULL,
  `session_year_id` bigint(20) UNSIGNED NOT NULL,
  `result` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=>Pass,0=>fail',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=>continue,0=>leave',
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `school_id` bigint(20) UNSIGNED DEFAULT NULL,
  `custom_role` tinyint(1) NOT NULL DEFAULT 1,
  `editable` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `school_id`, `custom_role`, `editable`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', NULL, 0, 0, '2023-11-25 08:38:41', '2023-11-25 08:38:41'),
(2, 'School Admin', 'web', NULL, 0, 0, '2023-11-25 08:38:41', '2023-11-25 08:38:41'),
(3, 'Teacher', 'web', NULL, 1, 1, '2024-02-15 20:56:33', '2024-02-15 20:56:33');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(17, 3),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(37, 3),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(41, 3),
(42, 2),
(43, 2),
(44, 2),
(45, 2),
(45, 3),
(46, 3),
(47, 3),
(48, 3),
(49, 2),
(49, 3),
(50, 2),
(51, 2),
(52, 2),
(53, 2),
(53, 3),
(54, 2),
(54, 3),
(55, 2),
(55, 3),
(56, 2),
(56, 3),
(57, 2),
(58, 2),
(59, 2),
(60, 2),
(61, 2),
(62, 2),
(63, 2),
(64, 2),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 3),
(70, 3),
(71, 3),
(72, 3),
(73, 3),
(74, 3),
(75, 3),
(76, 3),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 2),
(82, 2),
(83, 2),
(84, 2),
(85, 2),
(86, 2),
(87, 2),
(88, 2),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 3),
(98, 3),
(99, 3),
(100, 3),
(101, 2),
(101, 3),
(102, 2),
(103, 2),
(104, 2),
(105, 2),
(106, 2),
(107, 2),
(109, 2),
(110, 3),
(111, 2),
(111, 3),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(120, 2),
(121, 2),
(122, 2),
(123, 1),
(123, 2),
(125, 2),
(126, 2),
(127, 2),
(128, 1),
(129, 1),
(130, 2),
(130, 3),
(131, 2),
(131, 3),
(132, 2),
(132, 3),
(133, 2),
(133, 3),
(134, 2),
(134, 3),
(135, 2),
(135, 3),
(136, 2),
(136, 3),
(137, 2),
(137, 3),
(138, 2),
(139, 2),
(140, 2),
(141, 2),
(142, 2),
(143, 2),
(144, 2),
(145, 2),
(146, 1),
(146, 2),
(147, 1),
(147, 2),
(148, 1),
(148, 2),
(149, 1),
(149, 2),
(150, 2),
(151, 2),
(152, 2),
(153, 2),
(154, 2),
(155, 2),
(156, 2),
(157, 2),
(158, 2),
(159, 2),
(160, 2),
(161, 2),
(162, 2),
(163, 2),
(164, 2),
(165, 2),
(166, 2),
(167, 2),
(168, 2),
(169, 2),
(170, 2),
(171, 2),
(172, 2),
(173, 2),
(174, 1),
(175, 1),
(176, 1),
(177, 1),
(178, 2),
(178, 3),
(179, 1),
(180, 2),
(181, 2),
(182, 2),
(183, 2),
(184, 2),
(185, 2),
(186, 2),
(187, 2),
(188, 1),
(189, 1),
(190, 1),
(191, 1),
(192, 3),
(193, 3),
(194, 3),
(195, 3),
(196, 2),
(197, 1),
(199, 1),
(200, 1),
(201, 1);

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE `schools` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `support_phone` varchar(191) NOT NULL,
  `support_email` varchar(191) NOT NULL,
  `tagline` varchar(191) NOT NULL,
  `logo` varchar(191) NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'user_id',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 => Deactivate, 1 => Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `school_settings`
--

CREATE TABLE `school_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `data` text NOT NULL,
  `type` varchar(191) DEFAULT NULL COMMENT 'datatype like string , file etc',
  `school_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(512) NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `semesters`
--

CREATE TABLE `semesters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `start_month` tinyint(4) NOT NULL,
  `end_month` tinyint(4) NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `session_years`
--

CREATE TABLE `session_years` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(512) NOT NULL,
  `default` tinyint(4) NOT NULL DEFAULT 0,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shifts`
--

CREATE TABLE `shifts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(1024) NOT NULL,
  `link` varchar(191) DEFAULT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE `staffs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `qualification` varchar(512) DEFAULT NULL,
  `salary` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_support_schools`
--

CREATE TABLE `staff_support_schools` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `streams`
--

CREATE TABLE `streams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `class_section_id` bigint(20) UNSIGNED NOT NULL,
  `admission_no` varchar(512) NOT NULL,
  `roll_number` int(11) DEFAULT NULL,
  `admission_date` date NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `guardian_id` bigint(20) UNSIGNED NOT NULL,
  `session_year_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_online_exam_statuses`
--

CREATE TABLE `student_online_exam_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL COMMENT 'user_id',
  `online_exam_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1 - in progress 2 - completed',
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_subjects`
--

CREATE TABLE `student_subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL COMMENT 'user_id',
  `class_subject_id` bigint(20) UNSIGNED NOT NULL,
  `class_section_id` bigint(20) UNSIGNED NOT NULL,
  `session_year_id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(512) NOT NULL,
  `code` varchar(64) DEFAULT NULL,
  `bg_color` varchar(32) NOT NULL,
  `image` varchar(512) NOT NULL,
  `medium_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(64) NOT NULL COMMENT 'Theory / Practical',
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subject_teachers`
--

CREATE TABLE `subject_teachers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_section_id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL COMMENT 'user_id',
  `class_subject_id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `student_charge` double(8,4) NOT NULL,
  `staff_charge` double(8,4) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `billing_cycle` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_bills`
--

CREATE TABLE `subscription_bills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `amount` double(8,4) NOT NULL,
  `total_student` bigint(20) NOT NULL,
  `total_staff` bigint(20) NOT NULL,
  `payment_transaction_id` bigint(20) UNSIGNED DEFAULT NULL,
  `due_date` date NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_features`
--

CREATE TABLE `subscription_features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `feature_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `data` text NOT NULL,
  `type` varchar(191) DEFAULT NULL COMMENT 'datatype like string , file etc'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `data`, `type`) VALUES
(1, 'time_zone', 'Asia/Kolkata', 'string'),
(2, 'date_format', 'd-m-Y', 'date'),
(3, 'time_format', 'h:i A', 'time'),
(4, 'theme_color', '#22577A', 'string'),
(5, 'session_year', '1', 'string'),
(6, 'system_version', '1.1.1', 'string'),
(7, 'email_verified', '0', 'boolean'),
(8, 'subscription_alert', '7', 'integer'),
(9, 'currency_code', 'USD', 'string'),
(10, 'currency_symbol', '$', 'string'),
(11, 'additional_billing_days', '5', 'integer'),
(12, 'system_name', 'eSchool Saas', 'string'),
(13, 'address', '#262-263, Time Square Empire, SH 42 Mirjapar highway, Bhuj - Kutch 370001 Gujarat India.', 'string'),
(14, 'billing_cycle_in_days', '30', 'integer'),
(15, 'current_plan_expiry_warning_days', '7', 'integer');

-- --------------------------------------------------------

--
-- Table structure for table `timetables`
--

CREATE TABLE `timetables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject_teacher_id` bigint(20) UNSIGNED DEFAULT NULL,
  `class_section_id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `note` varchar(1024) DEFAULT NULL,
  `day` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') NOT NULL,
  `type` enum('Lecture','Break') NOT NULL,
  `semester_id` bigint(20) UNSIGNED DEFAULT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(128) NOT NULL,
  `last_name` varchar(128) NOT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `gender` varchar(16) DEFAULT NULL,
  `image` varchar(512) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `current_address` varchar(191) DEFAULT NULL,
  `permanent_address` varchar(191) DEFAULT NULL,
  `occupation` varchar(128) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `reset_request` tinyint(4) NOT NULL DEFAULT 0,
  `fcm_id` varchar(1024) DEFAULT NULL,
  `school_id` bigint(20) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `mobile`, `email`, `password`, `gender`, `image`, `dob`, `current_address`, `permanent_address`, `occupation`, `status`, `reset_request`, `fcm_id`, `school_id`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'super', 'admin', '', 'superadmin@gmail.com', '$2y$10$DJZwC0J71rUz92oU3SH1DOt1z.utiKFSGzlWjlwFZ4NZCDPzLJtWy', 'male', 'logo.svg', NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, '2023-11-25 08:38:41', '2023-11-25 08:38:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_status_for_next_cycles`
--

CREATE TABLE `user_status_for_next_cycles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_calendars`
--
ALTER TABLE `academic_calendars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `academic_calendars_school_id_foreign` (`school_id`),
  ADD KEY `academic_calendars_session_year_id_foreign` (`session_year_id`);

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `addons_feature_id_unique` (`feature_id`);

--
-- Indexes for table `addon_subscriptions`
--
ALTER TABLE `addon_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addon_subscriptions_school_id_foreign` (`school_id`),
  ADD KEY `addon_subscriptions_feature_id_foreign` (`feature_id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `announcements_school_id_foreign` (`school_id`),
  ADD KEY `announcements_session_year_id_foreign` (`session_year_id`);

--
-- Indexes for table `announcement_classes`
--
ALTER TABLE `announcement_classes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_columns` (`announcement_id`,`class_section_id`,`school_id`),
  ADD KEY `announcement_classes_school_id_foreign` (`school_id`),
  ADD KEY `announcement_classes_announcement_id_index` (`announcement_id`),
  ADD KEY `announcement_classes_class_section_id_index` (`class_section_id`),
  ADD KEY `announcement_classes_class_subject_id_foreign` (`class_subject_id`);

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assignments_school_id_foreign` (`school_id`),
  ADD KEY `assignments_class_section_id_foreign` (`class_section_id`),
  ADD KEY `assignments_class_subject_id_foreign` (`class_subject_id`),
  ADD KEY `assignments_session_year_id_foreign` (`session_year_id`),
  ADD KEY `assignments_created_by_foreign` (`created_by`),
  ADD KEY `assignments_edited_by_foreign` (`edited_by`);

--
-- Indexes for table `assignment_submissions`
--
ALTER TABLE `assignment_submissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assignment_submissions_assignment_id_foreign` (`assignment_id`),
  ADD KEY `assignment_submissions_school_id_foreign` (`school_id`),
  ADD KEY `assignment_submissions_student_id_foreign` (`student_id`),
  ADD KEY `assignment_submissions_session_year_id_foreign` (`session_year_id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendances_school_id_foreign` (`school_id`),
  ADD KEY `attendances_class_section_id_foreign` (`class_section_id`),
  ADD KEY `attendances_student_id_foreign` (`student_id`),
  ADD KEY `attendances_session_year_id_foreign` (`session_year_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_school_id_foreign` (`school_id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classes_school_id_foreign` (`school_id`),
  ADD KEY `classes_medium_id_foreign` (`medium_id`),
  ADD KEY `classes_shift_id_foreign` (`shift_id`),
  ADD KEY `classes_stream_id_foreign` (`stream_id`);

--
-- Indexes for table `class_sections`
--
ALTER TABLE `class_sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`class_id`,`section_id`,`medium_id`),
  ADD KEY `class_sections_school_id_foreign` (`school_id`),
  ADD KEY `class_sections_section_id_foreign` (`section_id`),
  ADD KEY `class_sections_medium_id_foreign` (`medium_id`);

--
-- Indexes for table `class_subjects`
--
ALTER TABLE `class_subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_ids` (`class_id`,`subject_id`,`virtual_semester_id`),
  ADD KEY `class_subjects_elective_subject_group_id_foreign` (`elective_subject_group_id`),
  ADD KEY `class_subjects_school_id_foreign` (`school_id`),
  ADD KEY `class_subjects_subject_id_foreign` (`subject_id`),
  ADD KEY `class_subjects_semester_id_foreign` (`semester_id`);

--
-- Indexes for table `class_teachers`
--
ALTER TABLE `class_teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`class_section_id`,`teacher_id`),
  ADD KEY `class_teachers_school_id_foreign` (`school_id`),
  ADD KEY `class_teachers_teacher_id_foreign` (`teacher_id`);

--
-- Indexes for table `compulsory_fees`
--
ALTER TABLE `compulsory_fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compulsory_fees_student_id_foreign` (`student_id`),
  ADD KEY `compulsory_fees_payment_transaction_id_foreign` (`payment_transaction_id`),
  ADD KEY `compulsory_fees_installment_id_foreign` (`installment_id`),
  ADD KEY `compulsory_fees_fees_paid_id_foreign` (`fees_paid_id`),
  ADD KEY `compulsory_fees_school_id_foreign` (`school_id`);

--
-- Indexes for table `elective_subject_groups`
--
ALTER TABLE `elective_subject_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `elective_subject_groups_school_id_foreign` (`school_id`),
  ADD KEY `elective_subject_groups_class_id_foreign` (`class_id`),
  ADD KEY `elective_subject_groups_semester_id_foreign` (`semester_id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exams_school_id_foreign` (`school_id`),
  ADD KEY `exams_class_id_foreign` (`class_id`),
  ADD KEY `exams_session_year_id_foreign` (`session_year_id`);

--
-- Indexes for table `exam_marks`
--
ALTER TABLE `exam_marks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_marks_school_id_foreign` (`school_id`),
  ADD KEY `exam_marks_exam_timetable_id_foreign` (`exam_timetable_id`),
  ADD KEY `exam_marks_student_id_foreign` (`student_id`),
  ADD KEY `exam_marks_class_subject_id_foreign` (`class_subject_id`),
  ADD KEY `exam_marks_session_year_id_foreign` (`session_year_id`);

--
-- Indexes for table `exam_results`
--
ALTER TABLE `exam_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_results_school_id_foreign` (`school_id`),
  ADD KEY `exam_results_exam_id_foreign` (`exam_id`),
  ADD KEY `exam_results_class_section_id_foreign` (`class_section_id`),
  ADD KEY `exam_results_student_id_foreign` (`student_id`),
  ADD KEY `exam_results_session_year_id_foreign` (`session_year_id`);

--
-- Indexes for table `exam_timetables`
--
ALTER TABLE `exam_timetables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_timetables_exam_id_foreign` (`exam_id`),
  ADD KEY `exam_timetables_school_id_foreign` (`school_id`),
  ADD KEY `exam_timetables_class_subject_id_foreign` (`class_subject_id`),
  ADD KEY `exam_timetables_session_year_id_foreign` (`session_year_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `salary_unique_records` (`staff_id`,`month`,`year`),
  ADD KEY `expenses_school_id_foreign` (`school_id`),
  ADD KEY `expenses_category_id_foreign` (`category_id`),
  ADD KEY `expenses_session_year_id_foreign` (`session_year_id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_categories_school_id_foreign` (`school_id`);

--
-- Indexes for table `extra_student_datas`
--
ALTER TABLE `extra_student_datas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `extra_student_datas_form_field_id_foreign` (`form_field_id`),
  ADD KEY `extra_student_datas_school_id_foreign` (`school_id`),
  ADD KEY `extra_student_datas_student_id_foreign` (`student_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fees_class_id_foreign` (`class_id`),
  ADD KEY `fees_school_id_foreign` (`school_id`),
  ADD KEY `fees_session_year_id_foreign` (`session_year_id`);

--
-- Indexes for table `fees_advance`
--
ALTER TABLE `fees_advance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fees_advance_compulsory_fee_id_foreign` (`compulsory_fee_id`),
  ADD KEY `fees_advance_student_id_foreign` (`student_id`),
  ADD KEY `fees_advance_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `fees_class_types`
--
ALTER TABLE `fees_class_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_ids` (`class_id`,`fees_type_id`,`school_id`,`fees_id`),
  ADD KEY `fees_class_types_fees_id_foreign` (`fees_id`),
  ADD KEY `fees_class_types_fees_type_id_foreign` (`fees_type_id`),
  ADD KEY `fees_class_types_school_id_foreign` (`school_id`);

--
-- Indexes for table `fees_installments`
--
ALTER TABLE `fees_installments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fees_installments_fees_id_foreign` (`fees_id`),
  ADD KEY `fees_installments_session_year_id_foreign` (`session_year_id`),
  ADD KEY `fees_installments_school_id_foreign` (`school_id`);

--
-- Indexes for table `fees_paids`
--
ALTER TABLE `fees_paids`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_ids` (`student_id`,`fees_id`,`school_id`),
  ADD KEY `fees_paids_fees_id_foreign` (`fees_id`),
  ADD KEY `fees_paids_school_id_foreign` (`school_id`);

--
-- Indexes for table `fees_types`
--
ALTER TABLE `fees_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fees_types_school_id_foreign` (`school_id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `files_modal_type_modal_id_index` (`modal_type`,`modal_id`),
  ADD KEY `files_school_id_foreign` (`school_id`);

--
-- Indexes for table `form_fields`
--
ALTER TABLE `form_fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`school_id`),
  ADD KEY `form_fields_school_id_foreign` (`school_id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grades_school_id_foreign` (`school_id`);

--
-- Indexes for table `guidances`
--
ALTER TABLE `guidances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `holidays_school_id_foreign` (`school_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_code_unique` (`code`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leaves_user_id_foreign` (`user_id`),
  ADD KEY `leaves_school_id_foreign` (`school_id`),
  ADD KEY `leaves_leave_master_id_foreign` (`leave_master_id`);

--
-- Indexes for table `leave_details`
--
ALTER TABLE `leave_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_details_leave_id_foreign` (`leave_id`),
  ADD KEY `leave_details_school_id_foreign` (`school_id`);

--
-- Indexes for table `leave_masters`
--
ALTER TABLE `leave_masters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_masters_session_year_id_foreign` (`session_year_id`),
  ADD KEY `leave_masters_school_id_foreign` (`school_id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lessons_school_id_foreign` (`school_id`),
  ADD KEY `lessons_class_section_id_foreign` (`class_section_id`),
  ADD KEY `lessons_class_subject_id_foreign` (`class_subject_id`);

--
-- Indexes for table `lesson_topics`
--
ALTER TABLE `lesson_topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_topics_lesson_id_foreign` (`lesson_id`),
  ADD KEY `lesson_topics_school_id_foreign` (`school_id`);

--
-- Indexes for table `mediums`
--
ALTER TABLE `mediums`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mediums_school_id_foreign` (`school_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `online_exams`
--
ALTER TABLE `online_exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_exams_school_id_foreign` (`school_id`),
  ADD KEY `online_exams_class_section_id_foreign` (`class_section_id`),
  ADD KEY `online_exams_class_subject_id_foreign` (`class_subject_id`),
  ADD KEY `online_exams_session_year_id_foreign` (`session_year_id`);

--
-- Indexes for table `online_exam_questions`
--
ALTER TABLE `online_exam_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_exam_questions_school_id_foreign` (`school_id`),
  ADD KEY `online_exam_questions_class_section_id_foreign` (`class_section_id`),
  ADD KEY `online_exam_questions_class_subject_id_foreign` (`class_subject_id`),
  ADD KEY `online_exam_questions_last_edited_by_foreign` (`last_edited_by`);

--
-- Indexes for table `online_exam_question_choices`
--
ALTER TABLE `online_exam_question_choices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_exam_question_choices_school_id_foreign` (`school_id`),
  ADD KEY `online_exam_question_choices_online_exam_id_foreign` (`online_exam_id`),
  ADD KEY `online_exam_question_choices_question_id_foreign` (`question_id`);

--
-- Indexes for table `online_exam_question_options`
--
ALTER TABLE `online_exam_question_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_exam_question_options_question_id_foreign` (`question_id`),
  ADD KEY `online_exam_question_options_school_id_foreign` (`school_id`);

--
-- Indexes for table `online_exam_student_answers`
--
ALTER TABLE `online_exam_student_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_exam_student_answers_school_id_foreign` (`school_id`),
  ADD KEY `online_exam_student_answers_student_id_foreign` (`student_id`),
  ADD KEY `online_exam_student_answers_online_exam_id_foreign` (`online_exam_id`),
  ADD KEY `online_exam_student_answers_question_id_foreign` (`question_id`),
  ADD KEY `online_exam_student_answers_option_id_foreign` (`option_id`);

--
-- Indexes for table `optional_fees`
--
ALTER TABLE `optional_fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `optional_fees_student_id_foreign` (`student_id`),
  ADD KEY `optional_fees_class_id_foreign` (`class_id`),
  ADD KEY `optional_fees_payment_transaction_id_foreign` (`payment_transaction_id`),
  ADD KEY `optional_fees_fees_class_id_foreign` (`fees_class_id`),
  ADD KEY `optional_fees_fees_paid_id_foreign` (`fees_paid_id`),
  ADD KEY `optional_fees_school_id_foreign` (`school_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_features`
--
ALTER TABLE `package_features`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique` (`package_id`,`feature_id`),
  ADD KEY `package_features_package_id_index` (`package_id`),
  ADD KEY `package_features_feature_id_index` (`feature_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_configurations`
--
ALTER TABLE `payment_configurations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_configurations_school_id_foreign` (`school_id`);

--
-- Indexes for table `payment_transactions`
--
ALTER TABLE `payment_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_transactions_user_id_foreign` (`user_id`),
  ADD KEY `payment_transactions_school_id_foreign` (`school_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `promote_students`
--
ALTER TABLE `promote_students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_columns` (`student_id`,`class_section_id`,`session_year_id`),
  ADD KEY `promote_students_school_id_foreign` (`school_id`),
  ADD KEY `promote_students_class_section_id_foreign` (`class_section_id`),
  ADD KEY `promote_students_session_year_id_foreign` (`session_year_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_school_id_unique` (`name`,`guard_name`,`school_id`),
  ADD KEY `roles_school_id_foreign` (`school_id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schools_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `school_settings`
--
ALTER TABLE `school_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `school_settings_name_school_id_unique` (`name`,`school_id`),
  ADD KEY `school_settings_school_id_foreign` (`school_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sections_school_id_foreign` (`school_id`);

--
-- Indexes for table `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `semesters_school_id_foreign` (`school_id`);

--
-- Indexes for table `session_years`
--
ALTER TABLE `session_years`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `session_years_name_school_id_unique` (`name`,`school_id`),
  ADD KEY `session_years_school_id_foreign` (`school_id`);

--
-- Indexes for table `shifts`
--
ALTER TABLE `shifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shifts_school_id_foreign` (`school_id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sliders_school_id_foreign` (`school_id`);

--
-- Indexes for table `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staffs_user_id_foreign` (`user_id`);

--
-- Indexes for table `staff_support_schools`
--
ALTER TABLE `staff_support_schools`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_school` (`user_id`,`school_id`),
  ADD KEY `staff_support_schools_school_id_foreign` (`school_id`);

--
-- Indexes for table `streams`
--
ALTER TABLE `streams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `streams_school_id_foreign` (`school_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_school_id_foreign` (`school_id`),
  ADD KEY `students_user_id_foreign` (`user_id`),
  ADD KEY `students_class_section_id_foreign` (`class_section_id`),
  ADD KEY `students_guardian_id_foreign` (`guardian_id`),
  ADD KEY `students_session_year_id_foreign` (`session_year_id`);

--
-- Indexes for table `student_online_exam_statuses`
--
ALTER TABLE `student_online_exam_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_online_exam_statuses_school_id_foreign` (`school_id`),
  ADD KEY `student_online_exam_statuses_student_id_foreign` (`student_id`),
  ADD KEY `student_online_exam_statuses_online_exam_id_foreign` (`online_exam_id`);

--
-- Indexes for table `student_subjects`
--
ALTER TABLE `student_subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_subjects_school_id_foreign` (`school_id`),
  ADD KEY `student_subjects_student_id_foreign` (`student_id`),
  ADD KEY `student_subjects_class_subject_id_foreign` (`class_subject_id`),
  ADD KEY `student_subjects_class_section_id_foreign` (`class_section_id`),
  ADD KEY `student_subjects_session_year_id_foreign` (`session_year_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subjects_school_id_foreign` (`school_id`),
  ADD KEY `subjects_medium_id_foreign` (`medium_id`);

--
-- Indexes for table `subject_teachers`
--
ALTER TABLE `subject_teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_ids` (`class_section_id`,`class_subject_id`,`teacher_id`),
  ADD KEY `subject_teachers_school_id_foreign` (`school_id`),
  ADD KEY `subject_teachers_subject_id_foreign` (`subject_id`),
  ADD KEY `subject_teachers_teacher_id_foreign` (`teacher_id`),
  ADD KEY `subject_teachers_class_subject_id_foreign` (`class_subject_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_package_id_foreign` (`package_id`),
  ADD KEY `subscriptions_school_id_foreign` (`school_id`);

--
-- Indexes for table `subscription_bills`
--
ALTER TABLE `subscription_bills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_bill` (`subscription_id`,`school_id`),
  ADD KEY `subscription_bills_school_id_foreign` (`school_id`),
  ADD KEY `subscription_bills_payment_transaction_id_foreign` (`payment_transaction_id`);

--
-- Indexes for table `subscription_features`
--
ALTER TABLE `subscription_features`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique` (`subscription_id`,`feature_id`),
  ADD KEY `subscription_features_feature_id_foreign` (`feature_id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `system_settings_name_unique` (`name`);

--
-- Indexes for table `timetables`
--
ALTER TABLE `timetables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `timetables_subject_teacher_id_foreign` (`subject_teacher_id`),
  ADD KEY `timetables_school_id_foreign` (`school_id`),
  ADD KEY `timetables_class_section_id_foreign` (`class_section_id`),
  ADD KEY `timetables_subject_id_foreign` (`subject_id`),
  ADD KEY `timetables_semester_id_foreign` (`semester_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_school_id_foreign` (`school_id`);

--
-- Indexes for table `user_status_for_next_cycles`
--
ALTER TABLE `user_status_for_next_cycles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_status_for_next_cycles_user_id_unique` (`user_id`),
  ADD KEY `user_status_for_next_cycles_school_id_foreign` (`school_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_calendars`
--
ALTER TABLE `academic_calendars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `addons`
--
ALTER TABLE `addons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `addon_subscriptions`
--
ALTER TABLE `addon_subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcement_classes`
--
ALTER TABLE `announcement_classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assignment_submissions`
--
ALTER TABLE `assignment_submissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class_sections`
--
ALTER TABLE `class_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class_subjects`
--
ALTER TABLE `class_subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class_teachers`
--
ALTER TABLE `class_teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `compulsory_fees`
--
ALTER TABLE `compulsory_fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elective_subject_groups`
--
ALTER TABLE `elective_subject_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_marks`
--
ALTER TABLE `exam_marks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_results`
--
ALTER TABLE `exam_results`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_timetables`
--
ALTER TABLE `exam_timetables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extra_student_datas`
--
ALTER TABLE `extra_student_datas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `fees`
--
ALTER TABLE `fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fees_advance`
--
ALTER TABLE `fees_advance`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fees_class_types`
--
ALTER TABLE `fees_class_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fees_installments`
--
ALTER TABLE `fees_installments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fees_paids`
--
ALTER TABLE `fees_paids`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fees_types`
--
ALTER TABLE `fees_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form_fields`
--
ALTER TABLE `form_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guidances`
--
ALTER TABLE `guidances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_details`
--
ALTER TABLE `leave_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_masters`
--
ALTER TABLE `leave_masters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lesson_topics`
--
ALTER TABLE `lesson_topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mediums`
--
ALTER TABLE `mediums`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `online_exams`
--
ALTER TABLE `online_exams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_exam_questions`
--
ALTER TABLE `online_exam_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_exam_question_choices`
--
ALTER TABLE `online_exam_question_choices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_exam_question_options`
--
ALTER TABLE `online_exam_question_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_exam_student_answers`
--
ALTER TABLE `online_exam_student_answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `optional_fees`
--
ALTER TABLE `optional_fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `package_features`
--
ALTER TABLE `package_features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_configurations`
--
ALTER TABLE `payment_configurations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_transactions`
--
ALTER TABLE `payment_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=393;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promote_students`
--
ALTER TABLE `promote_students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `schools`
--
ALTER TABLE `schools`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `school_settings`
--
ALTER TABLE `school_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `semesters`
--
ALTER TABLE `semesters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `session_years`
--
ALTER TABLE `session_years`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shifts`
--
ALTER TABLE `shifts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staffs`
--
ALTER TABLE `staffs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_support_schools`
--
ALTER TABLE `staff_support_schools`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `streams`
--
ALTER TABLE `streams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_online_exam_statuses`
--
ALTER TABLE `student_online_exam_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_subjects`
--
ALTER TABLE `student_subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subject_teachers`
--
ALTER TABLE `subject_teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_bills`
--
ALTER TABLE `subscription_bills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_features`
--
ALTER TABLE `subscription_features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `timetables`
--
ALTER TABLE `timetables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_status_for_next_cycles`
--
ALTER TABLE `user_status_for_next_cycles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `academic_calendars`
--
ALTER TABLE `academic_calendars`
  ADD CONSTRAINT `academic_calendars_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `academic_calendars_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`);

--
-- Constraints for table `addons`
--
ALTER TABLE `addons`
  ADD CONSTRAINT `addons_feature_id_foreign` FOREIGN KEY (`feature_id`) REFERENCES `features` (`id`);

--
-- Constraints for table `addon_subscriptions`
--
ALTER TABLE `addon_subscriptions`
  ADD CONSTRAINT `addon_subscriptions_feature_id_foreign` FOREIGN KEY (`feature_id`) REFERENCES `features` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `addon_subscriptions_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `announcements_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `announcements_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`);

--
-- Constraints for table `announcement_classes`
--
ALTER TABLE `announcement_classes`
  ADD CONSTRAINT `announcement_classes_announcement_id_foreign` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `announcement_classes_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`),
  ADD CONSTRAINT `announcement_classes_class_subject_id_foreign` FOREIGN KEY (`class_subject_id`) REFERENCES `class_subjects` (`id`),
  ADD CONSTRAINT `announcement_classes_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `assignments_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`),
  ADD CONSTRAINT `assignments_class_subject_id_foreign` FOREIGN KEY (`class_subject_id`) REFERENCES `class_subjects` (`id`),
  ADD CONSTRAINT `assignments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `assignments_edited_by_foreign` FOREIGN KEY (`edited_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `assignments_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assignments_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`);

--
-- Constraints for table `assignment_submissions`
--
ALTER TABLE `assignment_submissions`
  ADD CONSTRAINT `assignment_submissions_assignment_id_foreign` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assignment_submissions_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assignment_submissions_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`),
  ADD CONSTRAINT `assignment_submissions_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`),
  ADD CONSTRAINT `attendances_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendances_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`),
  ADD CONSTRAINT `attendances_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_medium_id_foreign` FOREIGN KEY (`medium_id`) REFERENCES `mediums` (`id`),
  ADD CONSTRAINT `classes_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `classes_shift_id_foreign` FOREIGN KEY (`shift_id`) REFERENCES `shifts` (`id`),
  ADD CONSTRAINT `classes_stream_id_foreign` FOREIGN KEY (`stream_id`) REFERENCES `streams` (`id`);

--
-- Constraints for table `class_sections`
--
ALTER TABLE `class_sections`
  ADD CONSTRAINT `class_sections_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `class_sections_medium_id_foreign` FOREIGN KEY (`medium_id`) REFERENCES `mediums` (`id`),
  ADD CONSTRAINT `class_sections_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_sections_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`);

--
-- Constraints for table `class_subjects`
--
ALTER TABLE `class_subjects`
  ADD CONSTRAINT `class_subjects_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `class_subjects_elective_subject_group_id_foreign` FOREIGN KEY (`elective_subject_group_id`) REFERENCES `elective_subject_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_subjects_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_subjects_semester_id_foreign` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`),
  ADD CONSTRAINT `class_subjects_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`);

--
-- Constraints for table `class_teachers`
--
ALTER TABLE `class_teachers`
  ADD CONSTRAINT `class_teachers_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`),
  ADD CONSTRAINT `class_teachers_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_teachers_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `compulsory_fees`
--
ALTER TABLE `compulsory_fees`
  ADD CONSTRAINT `compulsory_fees_fees_paid_id_foreign` FOREIGN KEY (`fees_paid_id`) REFERENCES `fees_paids` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `compulsory_fees_installment_id_foreign` FOREIGN KEY (`installment_id`) REFERENCES `fees_installments` (`id`),
  ADD CONSTRAINT `compulsory_fees_payment_transaction_id_foreign` FOREIGN KEY (`payment_transaction_id`) REFERENCES `payment_transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `compulsory_fees_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `compulsory_fees_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elective_subject_groups`
--
ALTER TABLE `elective_subject_groups`
  ADD CONSTRAINT `elective_subject_groups_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `elective_subject_groups_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `elective_subject_groups_semester_id_foreign` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`);

--
-- Constraints for table `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `exams_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `exams_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exams_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`);

--
-- Constraints for table `exam_marks`
--
ALTER TABLE `exam_marks`
  ADD CONSTRAINT `exam_marks_class_subject_id_foreign` FOREIGN KEY (`class_subject_id`) REFERENCES `class_subjects` (`id`),
  ADD CONSTRAINT `exam_marks_exam_timetable_id_foreign` FOREIGN KEY (`exam_timetable_id`) REFERENCES `exam_timetables` (`id`),
  ADD CONSTRAINT `exam_marks_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_marks_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`),
  ADD CONSTRAINT `exam_marks_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `exam_results`
--
ALTER TABLE `exam_results`
  ADD CONSTRAINT `exam_results_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`),
  ADD CONSTRAINT `exam_results_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`),
  ADD CONSTRAINT `exam_results_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_results_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`),
  ADD CONSTRAINT `exam_results_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `exam_timetables`
--
ALTER TABLE `exam_timetables`
  ADD CONSTRAINT `exam_timetables_class_subject_id_foreign` FOREIGN KEY (`class_subject_id`) REFERENCES `class_subjects` (`id`),
  ADD CONSTRAINT `exam_timetables_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_timetables_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_timetables_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`);

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `expense_categories` (`id`),
  ADD CONSTRAINT `expenses_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `expenses_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`),
  ADD CONSTRAINT `expenses_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`id`);

--
-- Constraints for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD CONSTRAINT `expense_categories_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `extra_student_datas`
--
ALTER TABLE `extra_student_datas`
  ADD CONSTRAINT `extra_student_datas_form_field_id_foreign` FOREIGN KEY (`form_field_id`) REFERENCES `form_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `extra_student_datas_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `extra_student_datas_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `fees`
--
ALTER TABLE `fees`
  ADD CONSTRAINT `fees_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `fees_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fees_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fees_advance`
--
ALTER TABLE `fees_advance`
  ADD CONSTRAINT `fees_advance_compulsory_fee_id_foreign` FOREIGN KEY (`compulsory_fee_id`) REFERENCES `compulsory_fees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fees_advance_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fees_advance_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fees_class_types`
--
ALTER TABLE `fees_class_types`
  ADD CONSTRAINT `fees_class_types_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fees_class_types_fees_id_foreign` FOREIGN KEY (`fees_id`) REFERENCES `fees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fees_class_types_fees_type_id_foreign` FOREIGN KEY (`fees_type_id`) REFERENCES `fees_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fees_class_types_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fees_installments`
--
ALTER TABLE `fees_installments`
  ADD CONSTRAINT `fees_installments_fees_id_foreign` FOREIGN KEY (`fees_id`) REFERENCES `fees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fees_installments_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fees_installments_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fees_paids`
--
ALTER TABLE `fees_paids`
  ADD CONSTRAINT `fees_paids_fees_id_foreign` FOREIGN KEY (`fees_id`) REFERENCES `fees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fees_paids_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fees_paids_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fees_types`
--
ALTER TABLE `fees_types`
  ADD CONSTRAINT `fees_types_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `form_fields`
--
ALTER TABLE `form_fields`
  ADD CONSTRAINT `form_fields_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `holidays`
--
ALTER TABLE `holidays`
  ADD CONSTRAINT `holidays_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leaves`
--
ALTER TABLE `leaves`
  ADD CONSTRAINT `leaves_leave_master_id_foreign` FOREIGN KEY (`leave_master_id`) REFERENCES `leave_masters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leaves_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leaves_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leave_details`
--
ALTER TABLE `leave_details`
  ADD CONSTRAINT `leave_details_leave_id_foreign` FOREIGN KEY (`leave_id`) REFERENCES `leaves` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leave_details_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leave_masters`
--
ALTER TABLE `leave_masters`
  ADD CONSTRAINT `leave_masters_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leave_masters_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`),
  ADD CONSTRAINT `lessons_class_subject_id_foreign` FOREIGN KEY (`class_subject_id`) REFERENCES `class_subjects` (`id`),
  ADD CONSTRAINT `lessons_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lesson_topics`
--
ALTER TABLE `lesson_topics`
  ADD CONSTRAINT `lesson_topics_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lesson_topics_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mediums`
--
ALTER TABLE `mediums`
  ADD CONSTRAINT `mediums_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `online_exams`
--
ALTER TABLE `online_exams`
  ADD CONSTRAINT `online_exams_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`),
  ADD CONSTRAINT `online_exams_class_subject_id_foreign` FOREIGN KEY (`class_subject_id`) REFERENCES `class_subjects` (`id`),
  ADD CONSTRAINT `online_exams_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `online_exams_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`);

--
-- Constraints for table `online_exam_questions`
--
ALTER TABLE `online_exam_questions`
  ADD CONSTRAINT `online_exam_questions_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`),
  ADD CONSTRAINT `online_exam_questions_class_subject_id_foreign` FOREIGN KEY (`class_subject_id`) REFERENCES `class_subjects` (`id`),
  ADD CONSTRAINT `online_exam_questions_last_edited_by_foreign` FOREIGN KEY (`last_edited_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `online_exam_questions_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `online_exam_question_choices`
--
ALTER TABLE `online_exam_question_choices`
  ADD CONSTRAINT `online_exam_question_choices_online_exam_id_foreign` FOREIGN KEY (`online_exam_id`) REFERENCES `online_exams` (`id`),
  ADD CONSTRAINT `online_exam_question_choices_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `online_exam_questions` (`id`),
  ADD CONSTRAINT `online_exam_question_choices_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `online_exam_question_options`
--
ALTER TABLE `online_exam_question_options`
  ADD CONSTRAINT `online_exam_question_options_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `online_exam_questions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `online_exam_question_options_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `online_exam_student_answers`
--
ALTER TABLE `online_exam_student_answers`
  ADD CONSTRAINT `online_exam_student_answers_online_exam_id_foreign` FOREIGN KEY (`online_exam_id`) REFERENCES `online_exams` (`id`),
  ADD CONSTRAINT `online_exam_student_answers_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `online_exam_question_options` (`id`),
  ADD CONSTRAINT `online_exam_student_answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `online_exam_question_choices` (`id`),
  ADD CONSTRAINT `online_exam_student_answers_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `online_exam_student_answers_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `optional_fees`
--
ALTER TABLE `optional_fees`
  ADD CONSTRAINT `optional_fees_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `optional_fees_fees_class_id_foreign` FOREIGN KEY (`fees_class_id`) REFERENCES `fees_class_types` (`id`),
  ADD CONSTRAINT `optional_fees_fees_paid_id_foreign` FOREIGN KEY (`fees_paid_id`) REFERENCES `fees_paids` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `optional_fees_payment_transaction_id_foreign` FOREIGN KEY (`payment_transaction_id`) REFERENCES `payment_transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `optional_fees_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `optional_fees_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `package_features`
--
ALTER TABLE `package_features`
  ADD CONSTRAINT `package_features_feature_id_foreign` FOREIGN KEY (`feature_id`) REFERENCES `features` (`id`),
  ADD CONSTRAINT `package_features_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`);

--
-- Constraints for table `payment_configurations`
--
ALTER TABLE `payment_configurations`
  ADD CONSTRAINT `payment_configurations_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_transactions`
--
ALTER TABLE `payment_transactions`
  ADD CONSTRAINT `payment_transactions_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payment_transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `promote_students`
--
ALTER TABLE `promote_students`
  ADD CONSTRAINT `promote_students_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`),
  ADD CONSTRAINT `promote_students_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `promote_students_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`),
  ADD CONSTRAINT `promote_students_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `schools`
--
ALTER TABLE `schools`
  ADD CONSTRAINT `schools_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `school_settings`
--
ALTER TABLE `school_settings`
  ADD CONSTRAINT `school_settings_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `semesters`
--
ALTER TABLE `semesters`
  ADD CONSTRAINT `semesters_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `session_years`
--
ALTER TABLE `session_years`
  ADD CONSTRAINT `session_years_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shifts`
--
ALTER TABLE `shifts`
  ADD CONSTRAINT `shifts_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sliders`
--
ALTER TABLE `sliders`
  ADD CONSTRAINT `sliders_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `staffs`
--
ALTER TABLE `staffs`
  ADD CONSTRAINT `staffs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `staff_support_schools`
--
ALTER TABLE `staff_support_schools`
  ADD CONSTRAINT `staff_support_schools_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `staff_support_schools_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `streams`
--
ALTER TABLE `streams`
  ADD CONSTRAINT `streams_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`),
  ADD CONSTRAINT `students_guardian_id_foreign` FOREIGN KEY (`guardian_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `students_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `students_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`),
  ADD CONSTRAINT `students_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `student_online_exam_statuses`
--
ALTER TABLE `student_online_exam_statuses`
  ADD CONSTRAINT `student_online_exam_statuses_online_exam_id_foreign` FOREIGN KEY (`online_exam_id`) REFERENCES `online_exams` (`id`),
  ADD CONSTRAINT `student_online_exam_statuses_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_online_exam_statuses_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `student_subjects`
--
ALTER TABLE `student_subjects`
  ADD CONSTRAINT `student_subjects_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`),
  ADD CONSTRAINT `student_subjects_class_subject_id_foreign` FOREIGN KEY (`class_subject_id`) REFERENCES `class_subjects` (`id`),
  ADD CONSTRAINT `student_subjects_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_subjects_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`),
  ADD CONSTRAINT `student_subjects_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_medium_id_foreign` FOREIGN KEY (`medium_id`) REFERENCES `mediums` (`id`),
  ADD CONSTRAINT `subjects_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subject_teachers`
--
ALTER TABLE `subject_teachers`
  ADD CONSTRAINT `subject_teachers_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`),
  ADD CONSTRAINT `subject_teachers_class_subject_id_foreign` FOREIGN KEY (`class_subject_id`) REFERENCES `class_subjects` (`id`),
  ADD CONSTRAINT `subject_teachers_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_teachers_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `subject_teachers_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`),
  ADD CONSTRAINT `subscriptions_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subscription_bills`
--
ALTER TABLE `subscription_bills`
  ADD CONSTRAINT `subscription_bills_payment_transaction_id_foreign` FOREIGN KEY (`payment_transaction_id`) REFERENCES `payment_transactions` (`id`),
  ADD CONSTRAINT `subscription_bills_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subscription_bills_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`id`);

--
-- Constraints for table `subscription_features`
--
ALTER TABLE `subscription_features`
  ADD CONSTRAINT `subscription_features_feature_id_foreign` FOREIGN KEY (`feature_id`) REFERENCES `features` (`id`),
  ADD CONSTRAINT `subscription_features_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`id`);

--
-- Constraints for table `timetables`
--
ALTER TABLE `timetables`
  ADD CONSTRAINT `timetables_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`),
  ADD CONSTRAINT `timetables_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `timetables_semester_id_foreign` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`),
  ADD CONSTRAINT `timetables_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `timetables_subject_teacher_id_foreign` FOREIGN KEY (`subject_teacher_id`) REFERENCES `subject_teachers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_status_for_next_cycles`
--
ALTER TABLE `user_status_for_next_cycles`
  ADD CONSTRAINT `user_status_for_next_cycles_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_status_for_next_cycles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;