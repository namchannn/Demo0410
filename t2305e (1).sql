-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th10 13, 2023 lúc 09:55 AM
-- Phiên bản máy phục vụ: 10.3.31-MariaDB-0ubuntu0.20.04.1
-- Phiên bản PHP: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `t2305e`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhom1_categories`
--

CREATE TABLE `nhom1_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `nhom1_categories`
--

INSERT INTO `nhom1_categories` (`id`, `name`) VALUES
(1, 'Tops'),
(2, 'Dress'),
(3, 'Shoe');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhom1_orders`
--

CREATE TABLE `nhom1_orders` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `order_date` date DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhom1_order_products`
--

CREATE TABLE `nhom1_order_products` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhom1_products`
--

CREATE TABLE `nhom1_products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `thumbnail` varchar(100) DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  `clothing_size` enum('S','M','L','XL') DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `shoe_size` enum('35','36','37','38','39','40') DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `nhom1_products`
--

INSERT INTO `nhom1_products` (`id`, `name`, `price`, `description`, `thumbnail`, `color`, `clothing_size`, `category_id`, `quantity`, `shoe_size`, `type`, `images`) VALUES
(1, 'SHEER RUFFLE BLOUSE', '240.00', 'ELEGANCE INFORMS THE WINNIE BLOUSE, AS SHOWN THROUGH ITS SHEER FABRICATION AND RUFFLE DETAILING. THIS STYLE FASTENS WITH A CONCEALED BUTTON CLOSURE AND A SELF-TIE NECKLINE. OR, WEAR IT UNDONE AND UNBUTTONED FOR A SEDUCTIVE TAKE ON DESK-TO-DINNER STYLING. SHEER FABRICATION RUFFLE DETAILING SELF-TIE NECKLINE CONCEALED BUTTON-FRONT CLOSURE LONG SLEEVES SPLIT CUFFS', 'https://i.imgur.com/by1RNzh.jpg', '#e0d2c7', NULL, 1, NULL, NULL, 'clothing', 'https://i.imgur.com/Uk6QD9p.jpg\r\nhttps://i.imgur.com/nv7dprR.jpg\r\nhttps://i.imgur.com/FIE3HTs.jpg'),
(2, 'HAMMERED SATIN REMOVABLE TIE DETAIL BLOUSE', '285.00', 'THE DARK BLUE GABRIELLE BLOUSE IS CRAFTED FROM A SATIN FABRICATION THAT S BEEN HAMMERED FOR A PREMIUM SHEEN, IDEAL FOR YOUR DESK-TO-DINNER MOMENTS. IT S DECORATED WITH A VERSATILE SELF-TIE DETAIL TO THE NECK AND CUFFS, WHICH CAN BE TIED OR WORN UNDONE FOR A UNIQUE APPEARANCE. A HIGH-LOW HEMLINE IS ADDED, IDEAL FOR STYLING OVER TROUSERS. HAMMERED SATIN FABRICATION. POINT COLLAR. SELF-TIE NECKLINE. LONG SLEEVES. CONCEALED BUTTON-FRONT CLOSURE. BOX PLEAT TO REVERSE. SELF-TIE CUFFS. HIGH-LOW HEMLINE', 'https://i.imgur.com/gsqkYvR.jpg', '#013e6d', NULL, 1, NULL, NULL, 'clothing', 'https://i.imgur.com/TdR8BoQ.jpg\r\nhttps://i.imgur.com/20KNdpf.jpg\r\nhttps://i.imgur.com/wbwYjRH.jpg'),
(3, 'OVERSIZED SHEER BUTTON-THROUGH SHIRT', '225.00', 'THE BLACK ADALINE GIVES A CLASSIC BUTTON-THROUGH SHIRT AN ALLURING UPDATE. ITS SHEER FABRICATION SUBTLY SHOWCASES THE FRAME AND OVERSIZED POCKETS FEATURE TO THE CHEST FOR PRACTICALITY AND A MODEST OUTLOOK. BUTTON THIS STYLE AS DESIRED AND TUCK INTO A PAIR OF REISS VELVET TROUSERS FOR AN INTOXICATING MOOD. SHEER FABRICATION POINT COLLAR CONCEALED BUTTON-FRONT CLOSURE LONG, BLOUSON SLEEVES BUTTONED CUFFS FLAP POCKETS TO CHEST SPLIT, HIGH-LOW HEMLINE OVERSIZED FIT', 'https://i.imgur.com/KfUpxa8.jpg', '#2f2f31', NULL, 1, NULL, NULL, 'clothing', 'https://i.imgur.com/pRCL5HN.jpg\r\nhttps://i.imgur.com/X0462Qe.jpg\r\nhttps://i.imgur.com/pQ0NBtF.jpg'),
(4, 'PLEAT FRONT LONG SLEEVE BLOUSE', '225.00', 'ROTATE OUT YOUR CLASSIC FORMAL BLOUSE WITH THE PALOMA, PICTURED HERE IN CREAM. THIS OPTION IS DESIGNED WITH AN ELEGANT PLEATED NECKLINE AND OVERSIZED CUFFS FOR A STANDOUT OFFICE EDIT. MAKE THIS PICK WORK OVERTIME BY STYLING WITH JEANS AND HEELS FOR WEEKEND PLANS. PLEATED FRONT. ROUND NECKLINE. LONG SLEEVES. OVERSIZED CUFFS.', 'https://i.imgur.com/06aJWMa.jpg', '#d5ccc3', NULL, 1, NULL, NULL, 'clothing', 'https://i.imgur.com/p0U7h0y.jpg\r\nhttps://i.imgur.com/dLGMK2V.jpg\r\nhttps://i.imgur.com/I9tVSpT.jpg\r\n'),
(5, 'VELVET OFF-THE-SHOULDER TOP', '145.00', 'CURATE AN EVENING-WORTHY EDIT WITH THE VELVET MIA TOP. IT S CRAFTED INTO A FIGURE-FLATTERING SHAPE AND CUT WITH AN ALLURING OFF-THE-SHOULDER NECKLINE. ADD TONAL TROUSERS AND HEELS TO MAXIMISE THE IMPACT. VELVET FABRICATION. OFF-THE-SHOULDER DESIGN. FITTED.', 'https://i.imgur.com/s9afOhr.jpg', '#0d0d0d', NULL, 1, NULL, NULL, 'clothing', 'https://i.imgur.com/M85Hyb2.jpg\r\nhttps://i.imgur.com/ACI75yr.jpg\r\nhttps://i.imgur.com/fCZljkH.jpg'),
(6, 'SILK DRAPED BLOUSE', '385.00', 'THE SILK OF THE LAILA BLOUSE IS DRAPED ACROSS THE FRAME WITH AN ASYMMETRIC SHAWL LAPEL AND PLUNGE NECKLINE. THIS STYLE IS PLEATED AROUND THE WAIST AND FITTED WITH BATWING-STYLE SLEEVES FOR AN ELEGANT OUTLOOK. PAIR WITH TAILORED TROUSERS AND EMBELLISHED ACCESSORIES FOR INSTANT EVENING APPEAL. 100% 19MM SILK PLUNGE NECKLINE ASYMMETRIC, DRAPED SHAWL LAPEL PLEATED WAIST LONG, BATWING SLEEVES BUTTONED CUFFS THE MODEL IS WEARING A SIZE 8 MEASUREMENTS OF MODEL: HEIGHT 5FT 10\" / 178CM', 'https://i.imgur.com/oWB7ZlY.jpg', '#f3f4f6', NULL, 1, NULL, NULL, 'clothing', 'https://i.imgur.com/emZ7030.jpg\r\nhttps://i.imgur.com/CaTVNsx.jpg\r\nhttps://i.imgur.com/XlVDb4a.jpg'),
(7, 'TIE DETAIL BLOUSE', '240.00', 'ROTATE OUT YOUR GO-TO BLOUSE IN FAVOUR OF THE IVORY GISELLE. IT’S CRAFTED FROM A LUSTROUS, FLOWING FABRICATION AND FITTED WITH TIE ELEMENTS TO THE CUFFS AND NECKLINE FOR ELEVATED APPEAL. ADJUST THE WEAR ACCORDINGLY, AND STYLE WITH TROUSERS AND HEELS. LONG SLEEVES TIE ELEMENT TO CUFFS SELF-TIE NECKLINE BUTTON FRONT CLOSURE', 'https://i.imgur.com/nw9K7JA.jpg', '#cfbbb4', NULL, 1, NULL, NULL, 'clothing', 'https://i.imgur.com/AvlrPNp.jpg\r\nhttps://i.imgur.com/7xA8eDn.jpg\r\nhttps://i.imgur.com/vHUp1m6.jpg'),
(8, 'SILK FRONT CREW NECK VEST', '240.00', 'THE DOTTY UPDATES A CLASSIC VEST SHAPE WITH REFINED STYLE DETAILS. NOTE ITS LUSTROUS SILK-FRONT PANEL, RIBBED TRIMS, AND FASHIONING STRIPE TO THE FRONT AND REVERSE. THIS STYLE CAN BE PARED DOWN OR ELEVATED RESPECTIVELY, DEPENDING ON YOUR MOOD. HYBRID SILK-KNIT CONSTRUCTION CREW NECKLINE SLEEVELESS FASHIONING STRIPE TO FRONT AND REVERSE RIBBED TRIMS THE MODEL IS WEARING A SIZE S MEASUREMENTS OF MODEL: 5FT9” / 175CM', 'https://i.imgur.com/KFec9fg.jpg', '#9c8f89', NULL, 1, NULL, NULL, 'clothing', 'https://i.imgur.com/H9Fvmdo.jpg\r\nhttps://i.imgur.com/frOX3VR.jpg\r\nhttps://i.imgur.com/qrU5rt2.jpg'),
(9, 'V-NECK SHELL BLOUSE', '110.00', 'ELEVATE YOUR DAY EDITS WITH ENDURING COMFORT, THANKS TO THE SOFT JERSEY FABRICATION OF THE TAYLOR BLOUSE. IT\'S CUT WITH A DEEP V-NECKLINE TO CURATE AN OPULENT MOOD. ITS SLEEVELESS SILHOUETTE AFFORDS VERSATILITY, WORKING WELL AS A STANDALONE PIECE WHILST LAYERING SMOOTHLY UNDER A BLAZER. TUCK INTO A PAIR OF OUR TAILORED TROUSERS AND FINISH WITH HEELS TO ACCENTUATE YOUR 9 TO 5 STYLING. JERSEY FABRICATION V-NECKLINE SLEEVELESS THE MODEL IS WEARING A SIZE 8 MEASUREMENTS OF MODEL: HEIGHT 5FT 10\" / 178CM', 'https://i.imgur.com/DifUTP4.jpg', '#e3e1e2', NULL, 1, NULL, NULL, 'clothing', 'https://i.imgur.com/TUQBSpF.jpg\r\nhttps://i.imgur.com/OkFyrh3.jpg\r\nhttps://i.imgur.com/ct0bUJA.jpg'),
(10, 'VELVET OFF-THE-SHOULDER TOP', '145.00', 'CURATE AN EVENING-WORTHY EDIT WITH THE VELVET MIA TOP. IT S CRAFTED INTO A FIGURE-FLATTERING SHAPE AND CUT WITH AN ALLURING OFF-THE-SHOULDER NECKLINE. ADD TONAL TROUSERS AND HEELS TO MAXIMISE THE IMPACT. VELVET FABRICATION. OFF-THE-SHOULDER DESIGN. FITTED.', 'https://i.imgur.com/pwn9QEe.jpg', '#40516f', NULL, 1, NULL, NULL, 'clothing', 'https://i.imgur.com/nYo7f3H.jpg\r\nhttps://i.imgur.com/Lk058uq.jpg\r\nhttps://i.imgur.com/nLsjEId.jpg'),
(11, 'COTTON POPLIN SHIRT', '160.00', 'THE JENNY SHIRT IS CRAFTED FROM A COTTON POPLIN FABRICATION. THE COLLAR AND FRONT PLACKET GIVE THIS SHIRT A VERSATILE PURPOSE WHERE IT CAN BE WORN CASUALLY WITH JEANS AND TRAINERS, PERFECT FOR GOING OUT OR DRESSED UP FORMALLY WITH A SUIT FOR A MODERN TAILORED LOOK. COTTON POPLIN. POINT COLLAR. FULL-BUTTONED PLACKET. FORMAL/CASUAL HYBRID WEARABILITY. LONG SLEEVES. BUTTONED SLEEVE CUFFS. REGULAR FIT. THE MODEL IS WEARING A SIZE 8. MEASUREMENTS OF MODEL: HEIGHT 5FT 10 / 178CM, CHEST 32\" / 81 CM, WAIST 24\" / 61CM.', 'https://i.imgur.com/IWupY26.jpg', '#f2f2f2', NULL, 1, NULL, NULL, 'clothing', 'https://i.imgur.com/34gNvO2.jpg\r\nhttps://i.imgur.com/OIXpSoN.jpg\r\nhttps://i.imgur.com/PQsAeus.jpg'),
(12, 'SILK SHIRT', '330.00', 'CHOOSE THE KHAKI HAILEY SHIRT, CUT FROM SMOOTH SILK FOR A SENSUAL FEEL AND A LUXURIOUS LOOK. IT\'S PUNCTUATED BY A CONCEALED BUTTON CLOSURE AND STATEMENT, OVERSIZED CUFFS. TUCK INTO A PAIR OF OUR WIDE-LEG TROUSERS, THEN ADD HEELS AND A BLAZER FOR A REFINED, DAYTIME LOOK THAT EASILY TRANSITIONS INTO EVENING PLANS. POINT COLLAR CONCEALED BUTTON FRONT CLOSURE OVERSIZED CUFFS BOX PLEAT TO REVERSE 19MM SILK SATIN FABRICATION THE MODEL IS WEARING A SIZE M MEASUREMENTS OF MODEL: HEIGHT 5FT 9\" / 175CM', 'https://i.imgur.com/HBdyiGB.jpg', '#e9e6e1', NULL, 1, NULL, NULL, 'clothing', 'https://i.imgur.com/RShibef.jpg\r\nhttps://i.imgur.com/gZ1vFw9.jpg\r\nhttps://i.imgur.com/iJsetsB.jpg'),
(13, 'VELVET BUTTON-THROUGH SHIRT', '265.00', 'OPT FOR THE CARLY SHIRT, CUT FROM TACTILE VELVET THAT\'S PERFECT FOR PARTY SEASON. IT\'S DESIGNED IN A CLASSIC LONG-SLEEVE SILHOUETTE AND FASTENS AT THE FRONT WITH BUTTONS. AN OVERSIZED COLLAR IS ADDED, DRAMATIZING THE LOOK. WEAR WITH TAILORED TROUSERS FOR A MODERN SUITING AGENDA. VELVET FABRICATION. POINT COLLAR. LONG SLEEVES. CONCEALED BUTTON FRONT CLOSURE.', 'https://i.imgur.com/4F9JhKo.jpg', '#101012', NULL, 1, NULL, NULL, 'clothing', 'https://i.imgur.com/y3Ztoq0.jpg\r\nhttps://i.imgur.com/ZQowGCo.jpg\r\nhttps://i.imgur.com/1Qy2tQq.jpg'),
(14, 'COTTON BUTTON-THROUGH SHIRT', '265.00', 'UPDATE YOUR CLASSIC SHIRTS WITH THE LIA. CRAFTED FROM 100% COTTON, IT’S A BREATHABLE, OFFICE-SAFE PICK THAT CAN BE TRANSITIONED FOR EVENING MOMENTS. A CONCEALED CLOSURE IS ADDED AND A CURVED HEMLINE COMPLETES THE SILHOUETTE. TUCK IN OR WEAR LOOSE WITH TAILORED TROUSERS FOR A TRADITIONAL-INSPIRED ENSEMBLE. 100% COTTON POINT COLLAR CONCEALED BUTTON-FRONT CLOSURE LONG SLEEVES BUTTONED CUFFS BOX PLEAT TO REVERSE CURVED HEMLINE THE MODEL IS WEARING A SIZE 8 MEASUREMENTS OF MODEL: HEIGHT 5FT 10\" / 178CM', 'https://i.imgur.com/3A3aQd8.jpg', '#afb4ba', NULL, 1, NULL, NULL, 'clothing', 'https://i.imgur.com/WZkNAzh.jpg\r\nhttps://i.imgur.com/hsRsZEn.jpg\r\nhttps://i.imgur.com/hWccvcT.jpg'),
(15, 'COTTON BLEND SWEATSHIRT', '160.00', 'LEND YOUR OFF-DUTY DAYS A NOTE OF LUXURY WITH THE IVORY BRANDY SWEATSHIRT. IT’S CRAFTED FROM A SOFT-FEEL COTTON BLEND INTO A CASUAL-FITTING, CREW-NECK SHAPE. LONG, RAGLAN SLEEVES ARE ADDED FOR ENHANCED COMFORT. PAIR WITH THE COORDINATING SHORTS AND TONAL TRAINERS FOR AN ON-TREND EDIT. COTTON BLEND CREW NECKLINE LONG, RAGLAN SLEEVES RUBBERISED REISS LOGO TO REVERSE CASUAL FIT THE MODEL IS WEARING A SIZE S MEASUREMENTS OF MODEL: HEIGHT 5FT 10\" / 178CM', 'https://i.imgur.com/ejlbU5x.jpg', '#c4b6a9', NULL, 1, NULL, NULL, 'clothing', 'https://i.imgur.com/L2Fkgkg.jpg\r\nhttps://i.imgur.com/mH64x9i.jpg\r\nhttps://i.imgur.com/d5XIM1A.jpg'),
(16, 'SILK SHIRT', '330.00', 'CHOOSE THE TEAL SOFIA SHIRT, A CLASSIC LONG-SLEEVE SHAPE CUT FROM A SMOOTH SILK-STRETCH BLEND. IT\'S DESIGNED IN A RELAXED SHAPE THAT ACCENTUATES THE FABRIC’S FLUIDITY, AND IT’S PUNCTUATED BY A CONCEALED CLOSURE. TUCK INTO A PAIR OF WIDE-LEG TROUSERS THEN ADD HEELS FOR A REFINED DAYTIME LOOK THAT EASILY TRANSITIONS INTO EVENING PLANS. SILK-STRETCH FABRICATION? POINT COLLAR CONCEALED BUTTON FRONT CLOSURE BOX PLEAT TO REVERSE THE MODEL IS WEARING A SIZE 8 MEASUREMENTS OF MODEL: 5FT9.5” / 176CM', 'https://i.imgur.com/rYt7sUy.jpg', '#c0b8b5', NULL, 1, NULL, NULL, 'clothing', 'https://i.imgur.com/8q7wmN8.jpg\r\nhttps://i.imgur.com/xl9CE3I.jpg\r\nhttps://i.imgur.com/0GN14eX.jpg'),
(17, 'METALLIC SCOOP NECK RACERBACK VEST', '210.00', 'AN EVERYDAY ESSENTIAL GETS A STYLISH UPDATE WITH THE GOLD LILLY VEST. ITS SCOOP NECKLINE AND RACERBACK DESIGN COMBINE FOR A CONFIDENT SHAPE, IDEAL FOR YOUR EVENING DINNER PLANS. IT’S CRAFTED WITH A METALLIC FABRICATION FOR AN UNDERSTATED - YET GLAMOROUS - SHEEN. STYLE WITH SUIT SEPARATES FOR A COMMANDING LOOK. METALLIC FABRICATION SCOOP NECKLINE RACERBACK DESIGN THE MODEL IS WEARING A SIZE 8 MEASUREMENTS OF MODEL: HEIGHT 5FT 10\" / 178CM', 'https://i.imgur.com/iEhcOih.jpg', '#bdb7a9', NULL, 1, NULL, NULL, 'clothing', 'https://i.imgur.com/kea6dAs.jpg\r\nhttps://i.imgur.com/37WXwaq.jpg\r\nhttps://i.imgur.com/BJxEPKx.jpg'),
(18, 'OVERSIZED SILK BUTTON THROUGH SHIRT', '385.00', 'INDULGE YOUR WORKWEAR ROTATION WITH THE CHAMPAGNE LOLA BLOUSE, AN OVERSIZED SHAPE CRAFTED FROM 100% SILK. IT’S FITTED WITH A CONCEALED CLOSURE FOR A SEAMLESS APPEARANCE. STATEMENT CUFFS MAKE THIS PIECE A CONFIDENT PICK, ESPECIALLY WHEN PAIRED WITH SMART TROUSERS AND HEELS. 100% SILK POINT COLLAR CONCEALED BUTTON CLOSURE LONG SLEEVES BUTTONED, OVERSIZED CUFFS OVERSIZED FIT THE MODEL IS WEARING A SIZE 8 MEASUREMENTS OF MODEL: HEIGHT 5FT 10\" / 178CM', 'https://i.imgur.com/vNgTBZo.jpg', '#c8b8b8', NULL, 1, NULL, NULL, 'clothing', 'https://i.imgur.com/lrP8ZYI.jpg\r\nhttps://i.imgur.com/GKxVZkN.jpg\r\nhttps://i.imgur.com/CB6J5qA.jpg'),
(19, 'FITTED LONG SLEEVE WRAP TOP', '210.00', 'A LONG-SLEEVE TOP GETS A REFINED UPDATE WITH THE ELLIE IN GREEN. IT’S CRAFTED FROM A HIGH-STRETCH FABRICATION AND WRAPS AROUND THE FRAME IN AN UNDERSTATED CROSS-OVER SHAPE. STYLE IT FOR BOTH CASUAL AND OCCASION PLANS WITH TAILORED TROUSERS AND HEELS. WRAP DESIGN LONG SLEEVES FITTED THE MODEL IS WEARING A SIZE S MEASUREMENTS OF MODEL: HEIGHT 5FT 10\" / 178CM', 'https://i.imgur.com/wvhirBd.jpg', '#222c24', NULL, 1, NULL, NULL, 'clothing', 'https://i.imgur.com/iByctrO.jpg\r\nhttps://i.imgur.com/sH5KqB2.jpg\r\nhttps://i.imgur.com/bO7mme1.jpg'),
(20, 'CHECK TIE NECK BLOUSE', '290.00', 'CHOOSE THE GABBI BLOUSE FOR TRANSITIONAL DESK-TO-DINNER APPEAL. ITS UNIQUE CHECK DESIGN LEANS INTO A MONOCHROME AGENDA, IDEAL FOR PAIRING WITH TONAL ACCESSORIES. A NECKTIE ELEMENT AND HIGH-LOW HEMLINE ALLOW YOU TO CUSTOMISE THE WEAR HOWEVER YOU PLEASE. CHECK DESIGN NECKTIE ELEMENT LONG SLEEVES BUTTONED CUFFS BOX PLEAT TO REVERSE HIGH-LOW HEMLINE THE MODEL IS WEARING A SIZE 8 MEASUREMENTS OF MODEL: HEIGHT 5FT 10\" / 178CM', 'https://i.imgur.com/Gl3XHAk.jpg', 'BLACK/WHITE\r\n', NULL, 1, NULL, NULL, 'clothing', 'https://i.imgur.com/wGx8AlF.jpg\r\nhttps://i.imgur.com/nGCBSNs.jpg\r\nhttps://i.imgur.com/l7TJUEU.jpg'),
(21, 'Pixie Platform Ankle Boots', '225.00', 'If you are looking for a pair of all-white boots that will complement any outfit, you have found just the one in these Pixie ankle boots. Featuring a sleek and sculptural silhouette marked by smooth, rounded curves, it is the polished and stark white finish that set these boots apart. Set atop outstanding 10.5cm platforms, they offer a flattering stature boost - their side zips also make them a breeze to put on and take off.\r\n', 'https://i.imgur.com/Mj27FVX.jpg', '#CFCED3', NULL, 3, NULL, NULL, 'shoe', 'https://i.imgur.com/eBGRQLk.jpg\r\nhttps://i.imgur.com/VzkMdez.jpg\r\nhttps://i.imgur.com/gkSKiKU.jpg'),
(22, 'Trice Metallic Accent Mary Janes', '150.00', 'Featuring a shiny boxed finish, these understated black Trice Mary Janes will instantly set you apart from the crowd. To top it off, they are adorned with metallic accents on the sides, which add an edgy touch to the design. Whether you opt for a cute dress or a grunge-inspired outfit, these Mary Janes will put a great finishing touch on your look', 'https://i.imgur.com/uW07FwJ.jpg', '#282B30', NULL, 3, NULL, NULL, 'shoe', 'https://i.imgur.com/GWnw8LC.jpg\r\nhttps://i.imgur.com/dYld7zT.jpg\r\nhttps://i.imgur.com/pjuGu37.jpg'),
(23, 'Trice Metallic Accent Pointed-Toe Slingback Pumps', '200.00', 'These Trice slingback pumps will have you looking immaculate and polished the moment you put them on. From the sharp pointed-toed silhouette to the bold slant heels and immaculate all-white finish, this pair will definitely make you stand out. Plus, their modest elevation means that they are great day-to-night shoes that are both comfortable and stylish', 'https://i.imgur.com/mspWNrt.jpg', '#EAE7E2', NULL, 3, NULL, NULL, 'shoe', 'https://i.imgur.com/fpvywQB.jpg\r\nhttps://i.imgur.com/6SXU8uq.jpg\r\nhttps://i.imgur.com/GjbGSL3.jpg'),
(24, 'Trice Metallic Accent Slide Sandals', '250.00', 'Whether you are running errands or enjoying a leisurely brunch date, these slide sandals are the perfect choice for elevating a casual look. With their cool shade of chalk and eye-catching triangle metallic accents, these neutral-toned beauties will effortlessly freshen up any ensemble from head to toe. The thick, bold strap and slightly elevated block heel provide all-day comfort, ensuring you can wear them with ease throughout your activities.\r\n', 'https://i.imgur.com/gTiehvd.jpg', '#EAE7E2', NULL, 3, NULL, NULL, 'shoe', 'https://i.imgur.com/TXOiALO.jpg\r\nhttps://i.imgur.com/X35CnWC.jpg\r\nhttps://i.imgur.com/hnEexp5.jpg'),
(25, 'Trice Metallic Accent Pointed-Toe Flats', '145.00', 'In a chic cool-toned nude finish, the Trice flats will slot seamlessly into your office outfit rotation. Featuring a pointed-toed silhouette and edgy triangular metallic accents for a hint of shine, these flats are smart and stylish at once. Best of all, these sophisticated beauties are easy to slip on and comfortable to wear all day long.', 'https://i.imgur.com/bTJCH4m.jpg', '#DFCAC5', NULL, 3, NULL, NULL, 'shoe', 'https://i.imgur.com/mncL4Wq.jpg\r\nhttps://i.imgur.com/8w0dPBq.jpg\r\nhttps://i.imgur.com/mpKMK1U.jpg'),
(26, 'Dash Double Strap Slides', '225.00', 'On days when black shoes may feel a little too heavy for your look, reach for these Dash sandals to add a pop of colour while still looking polished. They feature double straps and are set on 5cm ridged soles that offer a flattering height boost and extra traction for all-day walking. You can also find our classy brand insignia on the straps across the vamps', 'https://i.imgur.com/vZXzEom.jpg', '#EAE7E2', NULL, 3, NULL, NULL, 'shoe', 'https://i.imgur.com/KEa52YF.jpg\r\nhttps://i.imgur.com/8LRmkkk.jpg\r\nhttps://i.imgur.com/TViWX1j.jpg'),
(27, 'Trice Metallic Accent Loafers', '256.00', 'These Trice loafers are made for minimalists in mind. Featuring a classic and clean design that allows the distinctive metallic accents to truly shine and add a visually interesting element that will pull every look together with polish. Plus points for the low 2.5cm low-block heels that ensure they are great for all-day wear.\r\n', 'https://i.imgur.com/X5sgDSe.jpg', '#EAE7E2', NULL, 3, NULL, NULL, 'shoe', 'https://i.imgur.com/IBlKQMB.jpg\r\nhttps://i.imgur.com/5TBvA7Y.jpg\r\nhttps://i.imgur.com/isa7ToA.jpg'),
(28, 'Sepphe Tweed Metallic Buckle Heeled Mules', '235.00', 'Featuring a lovely tweed finish and contrasting brown straps, these Sepphe mules are the perfect pair to subtly elevate your style. Versatile enough to match well with a range of outfits - from the casual to the dressy - these shoes will also add textural interest to any look. Featuring subtle stitch-trim detailing, the straps are adorned with luxurious gold-toned buckles that add touches of captivating shine to the design. Set on sturdy 4.5cm block heels, these shoes offer a modest lift without compromising all-day walkability.', 'https://i.imgur.com/GE7vSo4.jpg', '#D8D5C6', NULL, 3, NULL, NULL, 'shoe', 'https://i.imgur.com/e5QcqlQ.jpg\r\nhttps://i.imgur.com/nM3HX3q.jpg\r\nhttps://i.imgur.com/DKN3kaO.jpg'),
(29, 'Sepphe Metallic Buckle D\'Orsay Pumps', '235.00', 'Step out in style in these polished Sepphe pumps in cream. Designed with an elegant pointed-toed silhouette that will elongate your frame, and set on statement-making trapeze block heels, these shoes are adorned with luxurious gold-toned buckles that add touches of captivating shine to the design. They will put the perfect finishing touch on all your workwear looks.\r\n', 'https://i.imgur.com/cWNAAJR.jpg', '#E6E2D7', NULL, 3, NULL, NULL, 'shoe', 'https://i.imgur.com/GdbAUdE.jpg\r\nhttps://i.imgur.com/JUVB3ax.jpg\r\nhttps://i.imgur.com/ml0jX20.jpg'),
(30, 'Sepphe Grommet Patent Slingback Pumps', '305.00', 'This two-tone iteration of our Sepphe pumps feature glossy white uppers and sleek grommet straps across the vamps. Set on 6cm heels, they will be manageable even if you have to be on the move. Plus, the pointed toes will elongate your frame, while the slingback straps ensure a secure fit. Let them see you through the work week in impeccable style.', 'https://i.imgur.com/ZC7shNo.jpg', '#D8D5C6', NULL, 3, NULL, NULL, 'shoe', 'https://i.imgur.com/uGQrTWY.jpg\r\nhttps://i.imgur.com/VWEqTiM.jpg\r\nhttps://i.imgur.com/8WebjHz.jpg'),
(31, 'Open Toe Curved Heel Sandals', '240.00', 'It is more than meets the eye when it comes to this pair of heeled sandals. While they may look simple at first glance, these shoes truly strike the perfect balance between edgy and effortless. The open square toes and adjustable ankle-straps offer an airy and comfortable fit for all-day wear. But the highlight of these shoes is without a doubt the artfully curved heels that come with a metallic finish that will elevate any look with subtle flair and shine.', 'https://i.imgur.com/L75eIoH.jpg', '#B8D0EA', NULL, 3, NULL, NULL, 'shoe', 'https://i.imgur.com/coAapbv.jpg\r\nhttps://i.imgur.com/qerj9St.jpg\r\nhttps://i.imgur.com/VUTJsiO.jpg'),
(32, 'Open Toe Curved Heel Sandals', '265.00', 'It is more than meets the eye when it comes to this pair of heeled sandals. While they may look simple at first glance, these shoes truly strike the perfect balance between edgy and effortless. The open square toes and adjustable ankle-straps offer an airy and comfortable fit for all-day wear. But the highlight of these shoes is without a doubt the artfully curved heels that come with a metallic finish that will elevate any look with subtle flair and shine.', 'https://i.imgur.com/NSvD4Ov.jpg', '#8A1F29', NULL, 3, NULL, NULL, 'shoe', 'https://i.imgur.com/YouMqMf.jpg\r\nhttps://i.imgur.com/nsaxh7z.jpg\r\nhttps://i.imgur.com/IhHmM2B.jpg'),
(33, 'Asymmetrical Strappy Sandals', '225.00', 'Combining sophistication, casual flair, and comfort, these sandals effortlessly complement virtually every item in your wardrobe. Whether you’re embarking on a relaxed day out or a brief errand run, these sandals will make you look put together and ready to go in an instant. Furthermore, they are designed with padded footbeds, ensuring prolonged comfort during extended wear throughout the day.', 'https://i.imgur.com/e7dMyx9.jpg', '#B8D0EA', NULL, 3, NULL, NULL, 'shoe', 'https://i.imgur.com/F4MEfth.jpg\r\nhttps://i.imgur.com/bkY4sBz.jpg\r\nhttps://i.imgur.com/VcbigrX.jpg'),
(34, 'Asymmetrical Strappy Sandals', '240.00', 'Combining sophistication, casual flair, and comfort, these sandals effortlessly complement virtually every item in your wardrobe. Whether you’re embarking on a relaxed day out or a brief errand run, these sandals will make you look put together and ready to go in an instant. Furthermore, they are designed with padded footbeds, ensuring prolonged comfort during extended wear throughout the day', 'https://i.imgur.com/l9LPQaw.jpg', '#EAE7E2', NULL, 3, NULL, NULL, 'shoe', 'https://i.imgur.com/S70RHZe.jpg\r\nhttps://i.imgur.com/wggUbn5.jpg\r\nhttps://i.imgur.com/IxVqQfB.jpg'),
(35, 'Asymmetric Curved Heel Slingback Pumps', '225.00', 'Navigate the delicate balance between edgy and elegant with these chic slingback pumps. Boasting a streamlined pointed-toe silhouette and a minimalist asymmetrical strappy design, these shoes will bring any look together while offering an interesting visual element. Additionally, the tastefully designed curved heels and petite metallic buckles enhance these shoes with an extra touch of sophistication', 'https://i.imgur.com/svwgYLQ.jpg', '#151515', NULL, 3, NULL, NULL, 'shoe', 'https://i.imgur.com/rmRi2BG.jpg\r\nhttps://i.imgur.com/PVa0JqV.jpg\r\nhttps://i.imgur.com/LGrhMXh.jpg'),
(36, 'Asymmetric Curved Heel Slingback Pumps', '115.00', 'Navigate the delicate balance between edgy and elegant with these chic slingback pumps. Boasting a streamlined pointed-toe silhouette and a minimalist asymmetrical strappy design, these shoes will bring any look together while offering an interesting visual element. Additionally, the tastefully designed curved heels and petite metallic buckles enhance these shoes with an extra touch of sophistication', 'https://i.imgur.com/Er2sUXT.jpg', '#8A1F29', NULL, 3, NULL, NULL, 'shoe', 'https://i.imgur.com/HHgaxgp.jpg\r\nhttps://i.imgur.com/nL1QV7H.jpg\r\nhttps://i.imgur.com/xt2eTXX.jpg'),
(37, 'Padded Strap Slingback Pumps', '235.00', 'When it comes to understated glamour, these padded strap pumps do it very well indeed. In a visually arresting shade of lilac, they will add a striking pop of colour to your every outfit. Featuring plush and padded vamps that add dimension to your look while providing comfort, the elasticated slingback straps also work to ensure you have the perfect fit.', 'https://i.imgur.com/lvzug21.jpg', '#E5C2D8', NULL, 3, NULL, NULL, 'shoe', 'https://i.imgur.com/n29BIgy.jpg\r\nhttps://i.imgur.com/FA4cGBi.jpg\r\nhttps://i.imgur.com/yxValaE.jpg'),
(38, 'Padded Strap Slingback Pumps', '256.00', 'When it comes to understated glamour, these padded strap pumps do it very well indeed. In a visually arresting shade of lilac, they will add a striking pop of colour to your every outfit. Featuring plush and padded vamps that add dimension to your look while providing comfort, the elasticated slingback straps also work to ensure you have the perfect fit.', 'https://i.imgur.com/luhF1Rv.jpg', '#E3E3E1', NULL, 3, NULL, NULL, 'shoe', 'https://i.imgur.com/DvTeij1.jpg\r\nhttps://i.imgur.com/4MBAZqn.jpg\r\nhttps://i.imgur.com/SGpjPe9.jpg'),
(39, 'Crystal-Embellished Nylon Flatform Sandals', '235.00', 'For stylish, easy-to-wear everyday shoes, reach for these crystal-embellished flatform sandals. The vibrant lilac finish adds a pop of colour to any outfit, while the crystals provide a touch of glamour and visual intrigue. Crafted from lightweight nylon and designed with cushioned soles, these sandals prioritise comfort without compromising style.', 'https://i.imgur.com/Ce7RpZo.jpg', '#E5C2D8', NULL, 3, NULL, NULL, 'shoe', 'https://i.imgur.com/mBGmfyi.jpg\r\nhttps://i.imgur.com/WBdFpw1.jpg\r\nhttps://i.imgur.com/0Gju8iV.jpg'),
(40, 'Crossover Crystal-Embellished Mules', '225.00', 'Inject colour into your everyday style with this gorgeous lilac version of our crossover mules. The crowning glory of these shoes is undoubtedly the crystal-embellished outsoles, which add a luxurious and glamorous element to the design. Set on 10cm cylindrical heels for an impressive height boost, these shoes also come with chunky crossover straps that are as stylish as they are supportive, so that you can stay comfortable in them all day long.', 'https://i.imgur.com/4xjGR8O.jpg', '#E5C2D8', NULL, 3, NULL, NULL, 'shoe', 'https://i.imgur.com/vZ6LmSb.jpg\r\nhttps://i.imgur.com/bOfswTF.jpg\r\nhttps://i.imgur.com/l1d4cW0.jpg'),
(41, 'Womens Jersey Skirt', '240.00', 'The Essentials jersey skirt is made in a lightweight cotton to provide comfort, drape, and movement. The ankle-length style includes side seam pockets and an encased elastic waistband with a drawstring for adjustability.', 'https://i.imgur.com/pQbyCDZ.png', '#F3F0E8', NULL, 2, NULL, NULL, 'clothing', 'https://i.imgur.com/IB1vMIV.png\r\nhttps://i.imgur.com/MBiXESp.png\r\nhttps://i.imgur.com/pHml7lC.png'),
(42, 'Womens Jersey Skirt', '265.00', 'The Essentials jersey skirt is made in a lightweight cotton to provide comfort, drape, and movement. The ankle-length style includes side seam pockets and an encased elastic waistband with a drawstring for adjustability.', 'https://i.imgur.com/xkV6tJj.png', '#1B1B1B', NULL, 2, NULL, NULL, 'clothing', 'https://i.imgur.com/giDiIyY.png\r\nhttps://i.imgur.com/CN7aBYd.png\r\nhttps://i.imgur.com/PWSjgTp.png'),
(43, 'Womens Jersey Skirt', '225.00', 'The Essentials jersey skirt is made in a lightweight cotton to provide comfort, drape, and movement. The ankle-length style includes side seam pockets and an encased elastic waistband with a drawstring for adjustability.\r\n', 'https://i.imgur.com/UpySYCV.png', '#B7B1AC', NULL, 2, NULL, NULL, 'clothing', 'https://i.imgur.com/KDo9exW.png\r\nhttps://i.imgur.com/WxurCoy.jpg\r\nhttps://i.imgur.com/DYy9ZUl.png'),
(44, 'Womens Jersey Skirt', '240.00', 'The Essentials jersey skirt is made in a lightweight cotton to provide comfort, drape, and movement. The ankle-length style includes side seam pockets and an encased elastic waistband with a drawstring for adjustability.', 'https://i.imgur.com/xFbcVrQ.png', '#ABA197', NULL, 2, NULL, NULL, 'clothing', 'https://i.imgur.com/dExXfXV.png\r\nhttps://i.imgur.com/kOCbmtO.jpg\r\nhttps://i.imgur.com/LMqyJH6.png'),
(45, 'Womens Jersey Skirt', '165.00', 'The Essentials jersey skirt is made in a lightweight cotton to provide comfort, drape, and movement. The ankle-length style includes side seam pockets and an encased elastic waistband with a drawstring for adjustability', 'https://i.imgur.com/QD1N1mK.png\r\n', '#CCB494', NULL, 2, NULL, NULL, 'clothing', 'https://i.imgur.com/sdvtx8p.png\r\nhttps://i.imgur.com/RgVnRFs.png\r\nhttps://i.imgur.com/KU1HKTV.png'),
(46, 'Womens 3/4 Sleeve Dress', '180.00', 'The Essentials 3/4 sleeve dress is designed with additional volume and length to provide a fashionable drape. A classic rib-knit crewneck and pockets allow casual functionality. The Essentials Fear of God logo is sized subtly in a rubberized soft-touch applique.', 'https://i.imgur.com/5nt692u.png', '#F3F0E8', NULL, 2, NULL, NULL, 'clothing', 'https://i.imgur.com/SxUrg1a.png\r\nhttps://i.imgur.com/baqFIlk.png\r\nhttps://i.imgur.com/Z0pIef6.png'),
(47, 'Womens 3/4 Sleeve Dress', '250.00', 'The Essentials 3/4 sleeve dress is designed with additional volume and length to provide a fashionable drape. A classic rib-knit crewneck and pockets allow casual functionality. The Essentials Fear of God logo is sized subtly in a rubberized soft-touch applique.', 'https://i.imgur.com/7s4fjZf.png', '#B7B1AC', NULL, 2, NULL, NULL, 'clothing', 'https://i.imgur.com/9epZDgk.png\r\nhttps://i.imgur.com/qJksdRu.png\r\nhttps://i.imgur.com/VzRpi0F.png'),
(48, 'Womens 3/4 Sleeve Dress', '250.00', 'The Essentials 3/4 sleeve dress is designed with additional volume and length to provide a fashionable drape. A classic rib-knit crewneck and pockets allow casual functionality. The Essentials Fear of God logo is sized subtly in a rubberized soft-touch applique', 'https://i.imgur.com/l6NEHjU.png', '#222124', NULL, 2, NULL, NULL, 'clothing', 'https://i.imgur.com/NoyTiYV.png\r\nhttps://i.imgur.com/kkJ40Rs.png\r\nhttps://i.imgur.com/tRV1e0c.png'),
(49, 'Womens 3/4 Sleeve Dress', '240.00', 'The Essentials 3/4 sleeve dress is designed with additional volume and length to provide a fashionable drape. A classic rib-knit crewneck and pockets allow casual functionality. The Essentials Fear of God logo is sized subtly in a rubberized soft-touch applique.', 'https://i.imgur.com/DcdMrPP.png', '#ABA197', NULL, 2, NULL, NULL, 'clothing', 'https://i.imgur.com/DVD5Xnn.png\r\nhttps://i.imgur.com/ppgSxnn.jpg\r\nhttps://i.imgur.com/rH9MFZ6.png'),
(50, 'Womens 3/4 Sleeve Dress', '235.00', 'The Essentials 3/4 sleeve dress is designed with additional volume and length to provide a fashionable drape. A classic rib-knit crewneck and pockets allow casual functionality. The Essentials Fear of God logo is sized subtly in a rubberized soft-touch applique.', 'https://i.imgur.com/VdMMznD.png', '#CCB494', NULL, 2, NULL, NULL, 'clothing', 'https://i.imgur.com/3YP8Cb9.png\r\nhttps://i.imgur.com/sjnBy4v.png\r\nhttps://i.imgur.com/TVCAsij.png'),
(51, 'Womens 3/4 T-Shirt Dress', '145.00', 'The 3/4 sleeve tee shirt dress embodies the Essentials women’s collection with an easy, comfortable approach to everyday style. The piece is designed in a relaxed, straight fit with pronounced drape and movement. Side seam pockets on the hip provide functionality.', 'https://i.imgur.com/isnu7M2.png', '#30312C', NULL, 2, NULL, NULL, 'clothing', 'https://i.imgur.com/h3xDidB.png\r\nhttps://i.imgur.com/1ZdCcAE.png\r\nhttps://i.imgur.com/rnMM9oa.png'),
(52, 'Womens Long Skirt', '265.00', 'The long skirt is made in a lightweight cotton jersey for drape and movement. Additional details include side seam pockets, encased elastic waistband, and an Essentials rubberized label is stitched on the center front.', 'https://i.imgur.com/dOcnjM2.png', '#D0C0A3', NULL, 2, NULL, NULL, 'clothing', 'https://i.imgur.com/4ylMhE1.png\r\nhttps://i.imgur.com/hOhZmCA.jpg\r\nhttps://i.imgur.com/unogokP.jpg'),
(53, 'Womens Long Skirt', '225.00', 'The long skirt is made in a lightweight cotton jersey for drape and movement. Additional details include side seam pockets, encased elastic waistband, and an Essentials rubberized label is stitched on the center front.', 'https://i.imgur.com/F4CHYaA.png\r\n', '#B3AEA5', NULL, 2, NULL, NULL, 'clothing', 'https://i.imgur.com/LZRRu1k.png\r\nhttps://i.imgur.com/33jpy8m.jpg\r\nhttps://i.imgur.com/ekhtXD3.jpg'),
(54, 'Womens Long Skirt', '240.00', 'The long skirt is made in a lightweight cotton jersey for drape and movement. Additional details include side seam pockets, encased elastic waistband, and an Essentials rubberized label is stitched on the center front.', 'https://i.imgur.com/fTncMUp.png', '#30312C', NULL, 2, NULL, NULL, 'clothing', 'https://i.imgur.com/JnzMVl1.png\r\nhttps://i.imgur.com/XiJgr72.jpg\r\nhttps://i.imgur.com/43nD0Dv.jpg'),
(55, 'Womens Long Skirt', '225.00', 'The long skirt is made in a lightweight cotton jersey for drape and movement. Additional details include side seam pockets, encased elastic waistband, and an Essentials rubberized label is stitched on the center front.\r\n', 'https://i.imgur.com/vpTHmSm.png', '#E2C380', NULL, 2, NULL, NULL, 'clothing', 'https://i.imgur.com/iNYhXTa.png\r\nhttps://i.imgur.com/vnK3qO6.png\r\nhttps://i.imgur.com/8VRZXsL.jpg'),
(56, 'Womens Long Skirt', '225.00', 'The long skirt is made in a lightweight cotton jersey for drape and movement. Additional details include side seam pockets, encased elastic waistband, and an Essentials rubberized label is stitched on the center front.', 'https://i.imgur.com/PP2Xo9U.png', '#87A19B', NULL, 2, NULL, NULL, 'clothing', 'https://i.imgur.com/8avJI9D.png\r\nhttps://i.imgur.com/qcksnh3.jpg\r\nhttps://i.imgur.com/aUxbKAk.jpg'),
(57, 'Womens Long Skirt', '256.00', 'The long skirt is made in a lightweight cotton jersey for drape and movement. Additional details include side seam pockets, encased elastic waistband, and an Essentials rubberized label is stitched on the center front.', 'https://i.imgur.com/ROHAN72.png', '#392D31', NULL, 2, NULL, NULL, 'clothing', 'https://i.imgur.com/4RDETE8.png\r\nhttps://i.imgur.com/zQLU5RG.png\r\nhttps://i.imgur.com/7CBdRjN.png'),
(58, 'Womens Essentials Jersey Skirt', '235.00', 'The Essentials jersey skirt is made in a lightweight cotton to provide comfort, drape, and movement. The ankle-length style includes side seam pockets and an encased elastic waistband with a drawstring for adjustability.', 'https://i.imgur.com/Z8lhW8T.png', '#1D1D1D', NULL, 2, NULL, NULL, 'clothing', 'https://i.imgur.com/oG54hEq.png\r\nhttps://i.imgur.com/rn5EKHW.jpg\r\nhttps://i.imgur.com/6jjkovy.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhom1_product_images`
--

CREATE TABLE `nhom1_product_images` (
  `id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `nhom1_product_images`
--

INSERT INTO `nhom1_product_images` (`id`, `image_path`, `product_id`) VALUES
(1, 'https://i.imgur.com/by1RNzh.jpg', 1),
(2, 'https://i.imgur.com/Uk6QD9p.jpg', 1),
(3, 'https://i.imgur.com/nv7dprR.jpg', 1),
(4, 'https://i.imgur.com/FIE3HTs.jpg', 1),
(5, 'https://i.imgur.com/gsqkYvR.jpg', 2),
(6, 'https://i.imgur.com/TdR8BoQ.jpg', 2),
(7, 'https://i.imgur.com/20KNdpf.jpg', 2),
(8, 'https://i.imgur.com/wbwYjRH.jpg', 2),
(9, 'https://i.imgur.com/KfUpxa8.jpg', 3),
(10, 'https://i.imgur.com/pRCL5HN.jpg', 3),
(11, 'https://i.imgur.com/X0462Qe.jpg', 3),
(12, 'https://i.imgur.com/pQ0NBtF.jpg', 3),
(13, 'https://i.imgur.com/06aJWMa.jpg', 4),
(14, 'https://i.imgur.com/p0U7h0y.jpg', 4),
(15, 'https://i.imgur.com/dLGMK2V.jpg', 4),
(16, 'https://i.imgur.com/I9tVSpT.jpg', 4),
(17, 'https://i.imgur.com/s9afOhr.jpg', 5),
(18, 'https://i.imgur.com/M85Hyb2.jpg', 5),
(19, 'https://i.imgur.com/ACI75yr.jpg', 5),
(20, 'https://i.imgur.com/fCZljkH.jpg', 5),
(21, 'https://i.imgur.com/oWB7ZlY.jpg', 6),
(22, 'https://i.imgur.com/emZ7030.jpg', 6),
(23, 'https://i.imgur.com/CaTVNsx.jpg', 6),
(24, 'https://i.imgur.com/XlVDb4a.jpg', 6),
(25, 'https://i.imgur.com/nw9K7JA.jpg', 7),
(26, 'https://i.imgur.com/AvlrPNp.jpg', 7),
(27, 'https://i.imgur.com/7xA8eDn.jpg', 7),
(28, 'https://i.imgur.com/vHUp1m6.jpg', 7),
(29, 'https://i.imgur.com/KFec9fg.jpg', 8),
(30, 'https://i.imgur.com/H9Fvmdo.jpg', 8),
(31, 'https://i.imgur.com/frOX3VR.jpg', 8),
(32, 'https://i.imgur.com/qrU5rt2.jpg', 8),
(33, 'https://i.imgur.com/DifUTP4.jpg', 9),
(34, 'https://i.imgur.com/TUQBSpF.jpg', 9),
(35, 'https://i.imgur.com/OkFyrh3.jpg', 9),
(36, 'https://i.imgur.com/ct0bUJA.jpg', 9),
(37, 'https://i.imgur.com/pwn9QEe.jpg', 10),
(38, 'https://i.imgur.com/nYo7f3H.jpg', 10),
(39, 'https://i.imgur.com/Lk058uq.jpg', 10),
(40, 'https://i.imgur.com/nLsjEId.jpg', 10),
(41, 'https://i.imgur.com/IWupY26.jpg', 11),
(42, 'https://i.imgur.com/34gNvO2.jpg', 11),
(43, 'https://i.imgur.com/OIXpSoN.jpg', 11),
(44, 'https://i.imgur.com/PQsAeus.jpg', 11),
(45, 'https://i.imgur.com/HBdyiGB.jpg', 12),
(46, 'https://i.imgur.com/RShibef.jpg', 12),
(47, 'https://i.imgur.com/gZ1vFw9.jpg', 12),
(48, 'https://i.imgur.com/iJsetsB.jpg', 12),
(49, 'https://i.imgur.com/4F9JhKo.jpg', 13),
(50, 'https://i.imgur.com/y3Ztoq0.jpg', 13),
(51, 'https://i.imgur.com/ZQowGCo.jpg', 13),
(52, 'https://i.imgur.com/1Qy2tQq.jpg', 13),
(53, 'https://i.imgur.com/3A3aQd8.jpg', 14),
(54, 'https://i.imgur.com/WZkNAzh.jpg', 14),
(55, 'https://i.imgur.com/hsRsZEn.jpg', 14),
(56, 'https://i.imgur.com/hWccvcT.jpg', 14),
(57, 'https://i.imgur.com/ejlbU5x.jpg', 15),
(58, 'https://i.imgur.com/L2Fkgkg.jpg', 15),
(59, 'https://i.imgur.com/mH64x9i.jpg', 15),
(60, 'https://i.imgur.com/d5XIM1A.jpg', 15),
(61, 'https://i.imgur.com/rYt7sUy.jpg', 16),
(62, 'https://i.imgur.com/8q7wmN8.jpg', 16),
(63, 'https://i.imgur.com/xl9CE3I.jpg', 16),
(64, 'https://i.imgur.com/0GN14eX.jpg', 16),
(65, 'https://i.imgur.com/iEhcOih.jpg', 17),
(66, 'https://i.imgur.com/kea6dAs.jpg', 17),
(67, 'https://i.imgur.com/37WXwaq.jpg', 17),
(68, 'https://i.imgur.com/BJxEPKx.jpg', 17),
(69, 'https://i.imgur.com/vNgTBZo.jpg', 18),
(70, 'https://i.imgur.com/lrP8ZYI.jpg', 18),
(71, 'https://i.imgur.com/GKxVZkN.jpg', 18),
(72, 'https://i.imgur.com/CB6J5qA.jpg', 18),
(73, 'https://i.imgur.com/wvhirBd.jpg', 19),
(74, 'https://i.imgur.com/iByctrO.jpg', 19),
(75, 'https://i.imgur.com/sH5KqB2.jpg', 19),
(76, 'https://i.imgur.com/bO7mme1.jpg', 19),
(77, 'https://i.imgur.com/Gl3XHAk.jpg', 20),
(78, 'https://i.imgur.com/wGx8AlF.jpg', 20),
(79, 'https://i.imgur.com/nGCBSNs.jpg', 20),
(80, 'https://i.imgur.com/l7TJUEU.jpg', 20),
(81, 'https://i.imgur.com/Mj27FVX.jpg', 21),
(82, 'https://i.imgur.com/eBGRQLk.jpg', 21),
(83, 'https://i.imgur.com/VzkMdez.jpg', 21),
(84, 'https://i.imgur.com/gkSKiKU.jpg', 21),
(85, 'https://i.imgur.com/uW07FwJ.jpg', 22),
(86, 'https://i.imgur.com/GWnw8LC.jpg', 22),
(87, 'https://i.imgur.com/dYld7zT.jpg', 22),
(88, 'https://i.imgur.com/pjuGu37.jpg', 22),
(89, 'https://i.imgur.com/mspWNrt.jpg', 23),
(90, 'https://i.imgur.com/fpvywQB.jpg', 23),
(91, 'https://i.imgur.com/6SXU8uq.jpg', 23),
(92, 'https://i.imgur.com/GjbGSL3.jpg', 23),
(93, 'https://i.imgur.com/gTiehvd.jpg', 24),
(94, 'https://i.imgur.com/TXOiALO.jpg', 24),
(95, 'https://i.imgur.com/X35CnWC.jpg', 24),
(96, 'https://i.imgur.com/hnEexp5.jpg', 24),
(97, 'https://i.imgur.com/bTJCH4m.jpg', 25),
(98, 'https://i.imgur.com/mncL4Wq.jpg', 25),
(99, 'https://i.imgur.com/8w0dPBq.jpg', 25),
(100, 'https://i.imgur.com/mpKMK1U.jpg', 25),
(101, 'https://i.imgur.com/vZXzEom.jpg', 26),
(102, 'https://i.imgur.com/KEa52YF.jpg', 26),
(103, 'https://i.imgur.com/8LRmkkk.jpg', 26),
(104, 'https://i.imgur.com/TViWX1j.jpg', 26),
(105, 'https://i.imgur.com/X5sgDSe.jpg', 27),
(106, 'https://i.imgur.com/IBlKQMB.jpg', 27),
(107, 'https://i.imgur.com/5TBvA7Y.jpg', 27),
(108, 'https://i.imgur.com/isa7ToA.jpg', 27),
(109, 'https://i.imgur.com/GE7vSo4.jpg', 28),
(110, 'https://i.imgur.com/e5QcqlQ.jpg', 28),
(111, 'https://i.imgur.com/nM3HX3q.jpg', 28),
(112, 'https://i.imgur.com/DKN3kaO.jpg', 28),
(113, 'https://i.imgur.com/cWNAAJR.jpg', 29),
(114, 'https://i.imgur.com/GdbAUdE.jpg', 29),
(115, 'https://i.imgur.com/JUVB3ax.jpg', 29),
(116, 'https://i.imgur.com/ml0jX20.jpg', 29),
(117, 'https://i.imgur.com/ZC7shNo.jpg', 30),
(118, 'https://i.imgur.com/uGQrTWY.jpg', 30),
(119, 'https://i.imgur.com/VWEqTiM.jpg', 30),
(120, 'https://i.imgur.com/8WebjHz.jpg', 30),
(121, 'https://i.imgur.com/L75eIoH.jpg', 31),
(122, 'https://i.imgur.com/coAapbv.jpg', 31),
(123, 'https://i.imgur.com/qerj9St.jpg', 31),
(124, 'https://i.imgur.com/VUTJsiO.jpg', 31),
(125, 'https://i.imgur.com/NSvD4Ov.jpg', 32),
(126, 'https://i.imgur.com/YouMqMf.jpg', 32),
(127, 'https://i.imgur.com/nsaxh7z.jpg', 32),
(128, 'https://i.imgur.com/IhHmM2B.jpg', 32),
(129, 'https://i.imgur.com/e7dMyx9.jpg', 33),
(130, 'https://i.imgur.com/F4MEfth.jpg', 33),
(131, 'https://i.imgur.com/bkY4sBz.jpg', 33),
(132, 'https://i.imgur.com/VcbigrX.jpg', 33),
(133, 'https://i.imgur.com/l9LPQaw.jpg', 34),
(134, 'https://i.imgur.com/S70RHZe.jpg', 34),
(135, 'https://i.imgur.com/wggUbn5.jpg', 34),
(136, 'https://i.imgur.com/IxVqQfB.jpg', 34),
(137, 'https://i.imgur.com/svwgYLQ.jpg', 35),
(138, 'https://i.imgur.com/rmRi2BG.jpg', 35),
(139, 'https://i.imgur.com/PVa0JqV.jpg', 35),
(140, 'https://i.imgur.com/LGrhMXh.jpg', 35),
(141, 'https://i.imgur.com/Er2sUXT.jpg', 36),
(142, 'https://i.imgur.com/HHgaxgp.jpg', 36),
(143, 'https://i.imgur.com/nL1QV7H.jpg', 36),
(144, 'https://i.imgur.com/xt2eTXX.jpg', 36),
(145, 'https://i.imgur.com/lvzug21.jpg', 37),
(146, 'https://i.imgur.com/n29BIgy.jpg', 37),
(147, 'https://i.imgur.com/FA4cGBi.jpg', 37),
(148, 'https://i.imgur.com/yxValaE.jpg', 37),
(149, 'https://i.imgur.com/luhF1Rv.jpg', 38),
(150, 'https://i.imgur.com/DvTeij1.jpg', 38),
(151, 'https://i.imgur.com/4MBAZqn.jpg', 38),
(152, 'https://i.imgur.com/SGpjPe9.jpg', 38),
(153, 'https://i.imgur.com/Ce7RpZo.jpg', 39),
(154, 'https://i.imgur.com/mBGmfyi.jpg', 39),
(155, 'https://i.imgur.com/WBdFpw1.jpg', 39),
(156, 'https://i.imgur.com/0Gju8iV.jpg', 39),
(157, 'https://i.imgur.com/4xjGR8O.jpg', 40),
(158, 'https://i.imgur.com/vZ6LmSb.jpg', 40),
(159, 'https://i.imgur.com/bOfswTF.jpg', 40),
(160, 'https://i.imgur.com/l1d4cW0.jpg', 40),
(161, 'https://i.imgur.com/pQbyCDZ.png', 41),
(162, 'https://i.imgur.com/IB1vMIV.png', 41),
(163, 'https://i.imgur.com/MBiXESp.png', 41),
(164, 'https://i.imgur.com/pHml7lC.png', 41),
(165, 'https://i.imgur.com/xkV6tJj.png', 42),
(166, 'https://i.imgur.com/giDiIyY.png', 42),
(167, 'https://i.imgur.com/CN7aBYd.png', 42),
(168, 'https://i.imgur.com/PWSjgTp.png', 42),
(169, 'https://i.imgur.com/UpySYCV.png', 43),
(170, 'https://i.imgur.com/KDo9exW.png', 43),
(171, 'https://i.imgur.com/WxurCoy.jpg', 43),
(172, 'https://i.imgur.com/DYy9ZUl.png', 43),
(173, 'https://i.imgur.com/xFbcVrQ.png', 44),
(174, 'https://i.imgur.com/dExXfXV.png', 44),
(175, 'https://i.imgur.com/kOCbmtO.jpg', 44),
(176, 'https://i.imgur.com/LMqyJH6.png', 44),
(177, 'https://i.imgur.com/QD1N1mK.png', 45),
(178, 'https://i.imgur.com/sdvtx8p.png', 45),
(179, 'https://i.imgur.com/RgVnRFs.png', 45),
(180, 'https://i.imgur.com/KU1HKTV.png', 45),
(181, 'https://i.imgur.com/5nt692u.png', 46),
(182, 'https://i.imgur.com/SxUrg1a.png', 46),
(183, 'https://i.imgur.com/baqFIlk.png', 46),
(184, 'https://i.imgur.com/Z0pIef6.png', 46),
(185, 'https://i.imgur.com/7s4fjZf.png', 47),
(186, 'https://i.imgur.com/9epZDgk.png', 47),
(187, 'https://i.imgur.com/qJksdRu.png', 47),
(188, 'https://i.imgur.com/VzRpi0F.png', 47),
(189, 'https://i.imgur.com/l6NEHjU.png', 48),
(190, 'https://i.imgur.com/NoyTiYV.png', 48),
(191, 'https://i.imgur.com/kkJ40Rs.png', 48),
(192, 'https://i.imgur.com/tRV1e0c.png', 48),
(193, 'https://i.imgur.com/DcdMrPP.png', 49),
(194, 'https://i.imgur.com/DVD5Xnn.png', 49),
(195, 'https://i.imgur.com/ppgSxnn.jpg', 49),
(196, 'https://i.imgur.com/rH9MFZ6.png', 49),
(197, 'https://i.imgur.com/VdMMznD.png', 50),
(198, 'https://i.imgur.com/3YP8Cb9.png', 50),
(199, 'https://i.imgur.com/sjnBy4v.png', 50),
(200, 'https://i.imgur.com/TVCAsij.png', 50),
(201, 'https://i.imgur.com/isnu7M2.png', 51),
(202, 'https://i.imgur.com/h3xDidB.png', 51),
(203, 'https://i.imgur.com/1ZdCcAE.png', 51),
(204, 'https://i.imgur.com/rnMM9oa.png', 51),
(205, 'https://i.imgur.com/dOcnjM2.png', 52),
(206, 'https://i.imgur.com/4ylMhE1.png', 52),
(207, 'https://i.imgur.com/hOhZmCA.jpg', 52),
(208, 'https://i.imgur.com/unogokP.jpg', 52),
(209, 'https://i.imgur.com/F4CHYaA.png', 53),
(210, 'https://i.imgur.com/LZRRu1k.png', 53),
(211, 'https://i.imgur.com/33jpy8m.jpg', 53),
(212, 'https://i.imgur.com/ekhtXD3.jpg', 53),
(213, 'https://i.imgur.com/fTncMUp.png', 54),
(214, 'https://i.imgur.com/JnzMVl1.png', 54),
(215, 'https://i.imgur.com/XiJgr72.jpg', 54),
(216, 'https://i.imgur.com/43nD0Dv.jpg', 54),
(217, 'https://i.imgur.com/vpTHmSm.png', 55),
(218, 'https://i.imgur.com/iNYhXTa.png', 55),
(219, 'https://i.imgur.com/vnK3qO6.png', 55),
(220, 'https://i.imgur.com/8VRZXsL.jpg', 55),
(221, 'https://i.imgur.com/PP2Xo9U.png', 56),
(222, 'https://i.imgur.com/8avJI9D.png', 56),
(223, 'https://i.imgur.com/qcksnh3.jpg', 56),
(224, 'https://i.imgur.com/aUxbKAk.jpg', 56),
(225, 'https://i.imgur.com/ROHAN72.png', 57),
(226, 'https://i.imgur.com/4RDETE8.png', 57),
(227, 'https://i.imgur.com/zQLU5RG.png', 57),
(228, 'https://i.imgur.com/7CBdRjN.png', 57),
(229, 'https://i.imgur.com/Z8lhW8T.png', 58),
(230, 'https://i.imgur.com/oG54hEq.png', 58),
(231, 'https://i.imgur.com/rn5EKHW.jpg', 58),
(232, 'https://i.imgur.com/6jjkovy.jpg', 58);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhom1_reviews`
--

CREATE TABLE `nhom1_reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `nhom1_categories`
--
ALTER TABLE `nhom1_categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `nhom1_orders`
--
ALTER TABLE `nhom1_orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `nhom1_order_products`
--
ALTER TABLE `nhom1_order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `nhom1_products`
--
ALTER TABLE `nhom1_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `nhom1_product_images`
--
ALTER TABLE `nhom1_product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `nhom1_reviews`
--
ALTER TABLE `nhom1_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `nhom1_categories`
--
ALTER TABLE `nhom1_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `nhom1_orders`
--
ALTER TABLE `nhom1_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `nhom1_order_products`
--
ALTER TABLE `nhom1_order_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `nhom1_products`
--
ALTER TABLE `nhom1_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT cho bảng `nhom1_product_images`
--
ALTER TABLE `nhom1_product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=233;

--
-- AUTO_INCREMENT cho bảng `nhom1_reviews`
--
ALTER TABLE `nhom1_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `nhom1_order_products`
--
ALTER TABLE `nhom1_order_products`
  ADD CONSTRAINT `nhom1_order_products_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `nhom1_orders` (`id`),
  ADD CONSTRAINT `nhom1_order_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `nhom1_products` (`id`);

--
-- Các ràng buộc cho bảng `nhom1_products`
--
ALTER TABLE `nhom1_products`
  ADD CONSTRAINT `nhom1_products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `nhom1_categories` (`id`);

--
-- Các ràng buộc cho bảng `nhom1_product_images`
--
ALTER TABLE `nhom1_product_images`
  ADD CONSTRAINT `nhom1_product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `nhom1_products` (`id`);

--
-- Các ràng buộc cho bảng `nhom1_reviews`
--
ALTER TABLE `nhom1_reviews`
  ADD CONSTRAINT `nhom1_reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `nhom1_products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
