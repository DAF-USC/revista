/*
    Un documento de proba con moitas opcións para poder ver o efecto nun texto
    de proba. So hai que comentar/descomentar liñas pa ver que fai cada cousa

    Ollo, esto é un documento de TYPST, non de LaTeX
    https://typst.app/
*/

// https://typst.app/docs/reference/model/par/
#set par(
    spacing: 3em,
    justify: true,
    justification-limits : (
        spacing: (
            min: 66.67% + 0pt,
            max: 150% + 0pt,
        ),
        tracking: (
            min: 0pt,
            max: 0pt,
        ),
    ),
)

// https://typst.app/docs/reference/text/text/
#set text(

    font      : "New Computer Modern",
    fallback  : false,
    size      : 9pt,
    lang      : "gl",
    region    : "ES",
    script    : "latn",
    dir       : ltr,
    style     : "normal",
    // style     : "italic",
    // style     : "oblique",
    // weight    : "thin",       // Thin weight (100).
    // weight    : "extralight", // Extra light weight (200).
    // weight    : "light",      // Light weight (300).
    weight    : "regular",    // Regular weight (400).
    // weight    : "medium",     // Medium weight (500).
    // weight    : "semibold",   // Semibold weight (600).
    // weight    : "bold",       // Bold weight (700).
    // weight    : "extrabold",  // Extrabold weight (800).
    // weight    : "black",      // Black weight (900).
    features  : (

        // NUMEROS:
        //
        // = 0: false
        // >=1: true
        //  Algunhas poden diferenciar valores como 1,2,3,4, etc. por exemplo,
        //  "salt = 2" toma o valor 2, pero "ss05 = 2" ignorao e simplemente se
        //  activa
        //
        // CLASIFICACIÓN DAS TÁBOAS
        //
        // S1  GSUB 1  simple substitution of one glyph for another
        // S2  GSUB 2  multiple replacement of one character by several glyphs
        // S3  GSUB 3  variant selection
        // S4  GSUB 4  ligatures
        // S5  GSUB 5  contextual substitution
        // S6  GSUB 6  chained contextual substitution
        // S7  GSUB 7  extension for GSUB tables past 64kB
        // S8  GSUB 8  reverse chained contextual substitution
        // P1  GPOS 1  positioning of single glyph
        // P2  GPOS 2  positioning of pair of glyphs
        // P3  GPOS 3  cursive attachment
        // P4  GPOS 4  positioning of mark glyphs relative to base
        // P5  GPOS 5  positioning of mark glyphs relative to ligature
        // P6  GPOS 6  positioning of mark glyphs relative to another mark glyph
        // P7  GPOS 7  contextual positioning
        // P8  GPOS 8  extended contextual positioning
        // P9  GPOS 9  extension for GPOS tables past 64kB
        //
        //  Info de: https://en.wikipedia.org/wiki/List_of_typographic_features

        // FEATURES PRIMARILY INTENDED FOR OR EXCLUSIVELY REQUIRED BY
        // SOUTH-ASIAN ALPHASYLLABARIES (INDIC/BRAHMIC)

        // abvf : 1, // S1    Above-base Forms                        Replaces the above-base part of a vowel sign. For Khmer and similar scripts.
        // abvm : 1, // P4,5  Above-base Mark Positioning             Positions a mark glyph above a base glyph.
        // abvs : 1, // S4    Above-base Mark Substitutions           Ligates a consonant with an above-mark.
        // blwf : 1, // S4    Below-base Forms                        Replaces halant+consonant combination with a subscript form.
        // blwm : 1, // P4,5  Below-base Mark Positioning             Positions a mark glyph below a base glyph.
        // blws : 1, // S4    Below-base Substitutions                Ligates a consonant with a below-mark.
        // pref : 1, // S4    Pre-base Forms                          Replaces halant+consonant at the end of a consonant cluster with a glyph at the beginning. Khmer, Myanmar, Malayalam, Telugu.
        // pres : 1, // S4,5  Pre-base Substitutions                  Ligates consonant combinations.
        // psts : 1, // S4    Post-base Substitutions                 Ligates a final consonant+consonant.
        // pstf : 1, // S4    Post-base Forms                         Replaces final halant+consonant with special form. Khmer and Gurmukhi, Malayalam
        // dist : 1, // P2    Distance                                Adjusts horizontal positioning between glyphs. (Always enabled, as opposed to 'kern'.)
        // akhn : 1, // S4    Akhand                                  Hindi for unbreakable. Ligates consonant+halant+consonant, usually only for k-ss and j-ny combinations.
        // haln : 1, // S4    Halant Forms                            Replaces a glyph for final consonant+halant.
        // half : 1, // S4    Half Forms                              Replaces consonant+halant with a half form, indicating it is part of a conjunct.
        // nukt : 1, // S4    Nukta Forms                             Replace consonant+nukta (dot mark) with single glyph.
        // rkrf : 1, // S4    Rakar Forms                             Replaces halant+ra with a rakar glyph, indicating it is part of a conjunct.
        // rphf : 1, // S4    Reph Form                               Replaces initial ra+halant with a final reph mark, indicating part of a conjunct.
        // vatu : 1, // S4    Vattu Variants                          Replaces consonant+rakar combinations with a vattu variant ligature.
        // cjct : 1, // S4    Conjunct Forms                          Ligates consonant+halant+consonant, indicates part of a conjunct.
        // cfar : 1, // S1    Conjunct Form After Ro                  Khmer

        // FEATURES PRIMARILY INTENDED FOR OR EXCLUSIVELY REQUIRED BY EAST-ASIAN
        // TETRAGRAMS (CHINESE, JAPANESE, KOREAN)

        // smpl : 1, // S1    Simplified Forms                        Replaces sinograms with their simplified versions, may be language dependent
        // trad : 1, // S1,3  Traditional Forms                       Replaces Chinese characters with their traditional versions
        // tnam : 1, // S1    Traditional Name Forms                  Japanese alternates for proper names
        // expt : 1, // S1    Expert Forms                            Typographic alternatives for some Japanese tetragrams
        // hojo : 1, //       Hojo Kanji Forms                        Hojo alternates for Japanese tetragrams
        // nlck : 1, //       NLC Kanji Forms                         NLC alternates for Japanese tetragrams
        // jp78 : 1, // S1,3  JIS 78 Forms                            JIS C 6226-1978 alternates for Japanese tetragrams, not accessible per Unicode
        // jp83 : 1, // S1    JIS 83 Forms                            JIS X 0208-1983 alternates for Japanese tetragrams, not accessible per Unicode
        // jp90 : 1, // S1    JIS 90 Forms                            JIS X 0208-1990 alternates for Japanese tetragrams, not accessible per Unicode
        // jp04 : 1, //       JIS 04 Forms                            JIS 2004 alternates for Japanese tetragrams, not accessible per Unicode
        // hngl : 1, // S1,3  Hangul                                  Transliterates Chinese-style characters with Korean Hangul
        // ljmo : 1, // S4    Leading Jamo Forms                      Initial group of consonants for a synthesized Korean Hangul tetragram
        // tjmo : 1, // S4    Trailing Jamo Forms                     Final group of consonants for a synthesized Korean Hangul tetragram
        // vjmo : 1, // S4    Vowel Jamo Forms                        Medial group of vowels for a synthesized Korean Hangul tetragram
        // fwid : 1, // S1    Full Widths                             Replaces proportionally spaced character with full-width versions (esp. for Latin letters within Chinese)
        // hwid : 1, // S1,P1 Half Widths                             Replaces uniformly-spaced characters with half-width version
        // halt : 1, // P1    Alternate Half Widths                   Re-positions full-width glyphs on half-width spaces
        // twid : 1, // S1,P1 Third Widths                            Replaces uniformly-spaced character with a version of 1/3 width (punctuation, etc.)
        // qwid : 1, // S1    Quarter Widths                          Replaces uniformly-spaced glyphs with quarter-width ones (punctuation etc.)
        // pwid : 1, // S1    Proportional Widths                     Replaces uniformly-spaced glyphs with proportional ones
        // palt : 1, // P1    Proportional Alternates                 Re-positions otherwise monospace characters according to glyph width
        // pkna : 1, // S1    Proportional Kana                       Kana for use alongside alphabets, without grid typography
        // ruby : 1, // S1    Ruby Notation Forms                     Ruby characters, small print
        // hkna : 1, // S1    Horizontal Kana Alternates              Alternate forms for horizontal kana text, e.g. ー for chōonpu instead of ｜, cf. vkna
        // vkna : 1, // S1    Vertical Kana                           Alternate Japanese kana forms for vertical text, e.g. ｜ for chōonpu instead of ー, cf. hkna
        // cpct : 1, // P1    Centered CJK Punctuation                Positions punctuation marks vertically and horizontally

        // FEATURES PRIMARILY INTENDED FOR OR EXCLUSIVELY REQUIRED BY
        // WEST-ASIAN (SEMITIC, ARABIC) AND OTHER CURSIVE SCRIPTS OR FONTS

        // curs : 1, // P3    Cursive Positioning                     Precise positioning of a letter's connection to an adjacent one
        // jalt : 1, // S3    Justification Alternates                User selectable wider and narrower alternates, used especially for justifying
        // mset : 1, // S5    Mark Positioning via Substitution       Used in Windows 95 for positioning of Arabic marks
        // rclt : 1, // S6    Required Contextual Alternates          Contextual alternates required for correct text display which differs from the default join for other letters, required especially important by Arabic
        // rlig : 1, // S3    Required Ligatures                      Ligatures required for correct text display (any script, but in cursive)
        // isol : 1, // S1    Isolated Forms                          Substitutes a special form of a letter occurring outside a word (required by Arabic and Syriac)
        // init : 1, // S1    Initial Forms                           Substitutes a special form of a letter occurring at the beginning of a word (required by Arabic and Syriac)
        // medi : 1, // S1    Medial Forms                            Substitutes a special form of letters between other letters in words (required by Arabic and Syriac)
        // med2 : 1, // S5    Medial Form #2                          Syriac
        // fina : 1, // S1    Terminal Forms                          Substitutes a special form of a letter at end of words (required by Arabic and Syriac)
        // fin2 : 1, // S5    Terminal Form #2                        Syriac
        // fin3 : 1, // S5    Terminal Form #3                        Syriac
        // falt : 1, // S3    Final Glyph on Line Alternates          Replaces final glyph on the line with an alternate
        // stch : 1, // S2    Stretching Glyph Decomposition          Substitutes a special form of a stretchy glyph onto one or more letters (required by Syriac)

        // FEATURES INTENDED FOR BICAMERAL [CASED] ALPHABETS (LATIN, GREEK,
        // CYRILLIC, ETC.)

        // smcp : 1, //  S1   Small Caps                              Replaces lower-case letters with small caps versions
        // c2sc : 1, //  S1   Capitals to Small Caps                  Substitutes capital letters with small caps
        // pcap : 1, //  S1   Petite Caps                             Replaces lower-case letters with their petite caps analogs
        // c2pc : 1, //  S1   Capitals to Petite Caps                 Replaces capital letters with petite caps
        // unic : 1, //  S1   Unicase                                 Replaces lowercase and uppercase letters with a set of single case glyphs
        // cpsp : 1, //  P1   Capital Spacing                         Adjusts spacing between letters in all-capitals text
        // case : 1, //  P1   Case Sensitive Forms                    Replace characters, especially punctuation, with forms better suited for all-capital text, cf. titl
        // ital : 1, //  S1   Italics                                 Replaces letter with corresponding italic glyph
        // ordn : 1, //  S6,4 Ordinals                                Replaces characters with ordinal forms for use after numbers

        // FEATURES DEPENDING ON WRITING DIRECTION

        // valt : 1, // P1    Alternative Vertical Metrics            Positions shorter characters to be centered vertically with full-height characters
        // vhal : 1, // P1    Alternative Vertical Half Metrics       Positions characters to be centered vertically with half-height characters
        // vpal : 1, // P1    Proportional Alternate Vertical Metrics Re-positions glyphs vertically to be centered on proportional full-height characters
        // vert : 1, // S1    Vertical Alternates                     A subset of vrt2: prefer the latter feature
        // vrt2 : 1, // S1    Vertical Alternates and Rotation        Replaces characters with forms suitable for vertical writing, possibly by rotating 90°
        // vrtr : 1, // S1    Vertical Alternates for Rotation        Replaces characters with forms suitable for vertical writing, possibly by shifting or shape
        // vkrn : 1, // P2,8  Vertical Kerning                        Fine vertical positioning of characters based on shape
        // ltra : 1, // S1    Left-to-right glyph alternates          Replaces characters with forms befitting left-to-right presentation (except mirrored forms)
        // ltrm : 1, // S1    Left-to-right mirrored forms            Replaces characters with possibly mirrored forms befitting left-to-right presentation
        // rtla : 1, // S1    Right-to-left glyph alternates          Replaces characters with forms befitting right-to-left presentation (except mirrored forms)
        // rtlm : 1, // S1    Right-to-left mirrored forms            Replaces characters with possibly mirrored forms befitting right-to-left presentation

        // FEATURES INTENDED FOR DIGITS AND MATH

        // lnum : 1, // S1    Lining Figures                          Replaces numerals with glyphs meant to fit better in all-capitals text, often also tnum
        // onum : 1, // S1    Oldstyle Figures                        Replaces numerals with cased old-style numerals, often also pnum
        // pnum : 1, // S1    Proportional Figures                    Replaces numerals with glyphs of proportional width, often also onum
        // tnum : 1, // S1    Tabular Figures                         Replaces numerals with glyphs of uniform width, often also lnum
        // frac : 1, // S4    Fractions                               Converts figures separated by slash with diagonal fraction
        // afrc : 1, // S4    Alternative Fractions                   Converts figures separated by slash with alternative stacked fraction form
        // dnom : 1, // S1    Denominator                             Converts to appropriate fraction denominator form, invoked by frac
        // numr : 1, // S1    Numerator                               Converts to appropriate fraction numerator form, invoked by frac
        // sinf : 1, // S1    Scientific Inferiors                    as in "H2O", "SOx" or "YCbCr" (but using the same font weight and predefined position in contrast these plain HTML subs and sups)
        // zero : 1, // S1    Slashed Zero                            Replaces 0 figure with slashed 0
        // mgrk : 1, // S1    Mathematical Greek                      Replaces Greek characters with special forms for use in mathematics
        // flac : 1, //       Flattened accent forms                  This feature is applied to individual glyphs during layout of math formula.
        // dtls : 1, //       Dotless Forms                           The dotless forms are to be used as base forms for placing mathematical accents over them.
        // ssty : 1, //       Math script style alternates            This feature can have a parameter indicating the script level: 1 for simple subscripts and superscripts, 2 for second level subscripts and superscripts (that is, scripts on scripts), and so on. (Currently, only the first two alternates are used). For glyphs that are not covered by this feature, the original glyph is used in subscripts and superscripts.

        // LIGATION AND ALTERNATE FORMS FEATURES INTENDED FOR ALL SCRIPTS

        // aalt : 1, // S1,3 Access All Alternates                    Special feature: used to present user with choice all alternate forms of the character
        // swsh : 1, // S1,3 Swash                                    Either replaces character with or displays multiple swashed versions
        // cswh : 1, // S8   Contextual Swash                         Converts letter to a swashed version based on characters around the letter
        // calt : 1, // S6   Contextual Alternates                    Applies a second substitution feature based on a match of a character pattern within a context of surrounding patterns
        // hist : 1, // S1   Historical Forms                         Obsolete forms of characters to be applied at the user's discretion, cf. hlig
        // locl : 1, // S1   Localized Forms                          Replaces character with the preferred form based on script language
        // rand : 1, // S3   Randomize                                Replaces character with random forms (meant to simulate handwriting)
        // nalt : 1, // S1,3 Alternate Annotation Forms               Provides user access to circled digits, inverse letters etc.
        // cv01 : 1, // S3   Character Variant 1–99                   Multiple variants of a single character, which may not apply to many other characters, see references for voluminous documentation
        // cv02 : 1, // |
        // cv03 : 1, // |
        // cv04 : 1, // |
        // cv05 : 1, // |
        // cv06 : 1, // |
        // cv07 : 1, // |
        // cv08 : 1, // |
        // cv09 : 1, // |
        // cv10 : 1, // |
        // cv11 : 1, // |
        // cv12 : 1, // |
        // cv13 : 1, // |
        // cv14 : 1, // |
        // cv15 : 1, // |
        // cv16 : 1, // |
        // cv17 : 1, // |
        // cv18 : 1, // |
        // cv19 : 1, // |
        // cv20 : 1, // |
        // cv21 : 1, // |
        // cv22 : 1, // |
        // cv23 : 1, // |
        // cv24 : 1, // |
        // cv25 : 1, // |
        // cv26 : 1, // |
        // cv27 : 1, // |
        // cv28 : 1, // |
        // cv29 : 1, // |
        // cv30 : 1, // |
        // cv31 : 1, // |
        // cv32 : 1, // |
        // cv33 : 1, // |
        // cv34 : 1, // |
        // cv35 : 1, // |
        // cv36 : 1, // |
        // cv37 : 1, // |
        // cv38 : 1, // |
        // cv39 : 1, // |
        // cv40 : 1, // |
        // cv41 : 1, // |
        // cv42 : 1, // |
        // cv43 : 1, // |
        // cv44 : 1, // |
        // cv45 : 1, // |
        // cv46 : 1, // |
        // cv47 : 1, // |
        // cv48 : 1, // |
        // cv49 : 1, // |
        // cv50 : 1, // |
        // cv51 : 1, // |
        // cv52 : 1, // |
        // cv53 : 1, // |
        // cv54 : 1, // |
        // cv55 : 1, // |
        // cv56 : 1, // |
        // cv57 : 1, // |
        // cv58 : 1, // |
        // cv59 : 1, // |
        // cv60 : 1, // |
        // cv61 : 1, // |
        // cv62 : 1, // |
        // cv63 : 1, // |
        // cv64 : 1, // |
        // cv65 : 1, // |
        // cv66 : 1, // |
        // cv67 : 1, // |
        // cv68 : 1, // |
        // cv69 : 1, // |
        // cv70 : 1, // |
        // cv71 : 1, // |
        // cv72 : 1, // |
        // cv73 : 1, // |
        // cv74 : 1, // |
        // cv75 : 1, // |
        // cv76 : 1, // |
        // cv77 : 1, // |
        // cv78 : 1, // |
        // cv79 : 1, // |
        // cv80 : 1, // |
        // cv81 : 1, // |
        // cv82 : 1, // |
        // cv83 : 1, // |
        // cv84 : 1, // |
        // cv85 : 1, // |
        // cv86 : 1, // |
        // cv87 : 1, // |
        // cv88 : 1, // |
        // cv89 : 1, // |
        // cv90 : 1, // |
        // cv91 : 1, // |
        // cv92 : 1, // |
        // cv93 : 1, // |
        // cv94 : 1, // |
        // cv95 : 1, // |
        // cv96 : 1, // |
        // cv97 : 1, // |
        // cv98 : 1, // |
        // cv99 : 1, // |
        // salt : 1, // S1,3 Stylistic Alternates                     Either replaces with, or displays list of, stylistic alternatives for a character
        // ss01 : 1, // S1   Stylistic Set 1 – 20                     Replaces character with one from a font-specific set of stylistic alternatives
        // ss02 : 1, // |
        // ss03 : 1, // |
        // ss04 : 1, // |
        // ss05 : 1, // |
        // ss06 : 1, // |
        // ss07 : 1, // |
        // ss08 : 1, // |
        // ss09 : 1, // |
        // ss10 : 1, // |
        // ss11 : 1, // |
        // ss12 : 1, // |
        // ss13 : 1, // |
        // ss14 : 1, // |
        // ss15 : 1, // |
        // ss16 : 1, // |
        // ss17 : 1, // |
        // ss18 : 1, // |
        // ss19 : 1, // |
        // ss20 : 1, // |
        // subs : 1, // S1   Subscript                                Replaces character with subscript version, cf. numr
        // sups : 1, // S1   Superscript                              Replaces character with superscript version, cf. dnom
        // titl : 1, // S1   Titling Alternates                       Replaces characters with forms suited for large type, as in titles
        // rvrn : 1, // S1   Required Variation Alternates            Special variants of a single character, which need apply to specific font variation, required by variable fonts
        // clig : 1, // S8   Contextual Ligatures                     Applies a second ligature feature based on a match of a character pattern within a context of surrounding patterns
        // dlig : 1, // S4   Discretionary Ligatures                  Ligatures to be applied at the user's discretion
        // hlig : 1, // S1   Historical Ligatures                     Obsolete ligatures to be applied at the user's discretion
        // liga : 0, // S4   Standard Ligatures                       Replaces (by default) sequence of characters with a single ligature glyph

        // POSITIONING FEATURES INTENDED FOR ALL SCRIPTS

        // ccmp : 0, // S4,2 Glyph Composition/Decomposition          Either calls a ligature replacement on a sequence of characters or replaces a character with a sequence of glyphs. Provides logic that can for example effectively alter the order of input characters.
        // kern : 0, // P2,8 Kerning                                  Fine horizontal positioning of one glyph to the next, based on the shapes of the glyphs
        // mark : 0, // P4,5 Mark Positioning                         Fine positioning of a mark glyph to a base character
        // mkmk : 0, // P6   Mark-to-mark Positioning                 Fine positioning of a mark glyph to another mark character
        // opbd : 0, // P1   Optical Bounds                           Re-positions glyphs at beginning and end of line, for precise justification of text.
        // lfbd : 0, // P1   Left Bounds                              Re-positions glyphs at end of line. Called by opbd.
        // rtbd : 0, // P1   Right Bounds                             Re-positions glyphs at beginning of line. Called by opbd.

        // SPECIAL FEATURES INTENDED FOR ALL SCRIPTS

        // size : 0, //      Optical size                             Not a lookup: feature's table provides to applications information about the appearance and intent of the font, to aid in font selection.
        // ornm : 1, // S3,1 Ornaments                                Decorative alternates for the bullet character •

    )
)

1234567890

1 2 3 4 5 6 7 8 9 0

abcdefghijklmnñopqrstuvwxyz

a b c d e f g h i j k l m n ñ o p q r s t u v w x y z

ABCDEFGHIJKLMNÑOPQRSTUVWXYZ

A B C D E F G H I J K L M N Ñ O P Q R S T U V W X Y Z

// Textos de: https://www.typography.com/blog/text-for-proofing-fonts

aaron abduct accidental adjacent aeron afghan after agnostic aint anaheim and anybody although allotted ambidextrous amend announced aqua arrangement ask aspin ate attitude authorised avant avery award axolotl baby baghdad banana balter batty baste beeped bent binded billow bizarre blood bottle bowwow boyfriend builder bubbly buzzing byproduct bystander byzantine cappuccino cattle cent chant cicero close coccyx cooked copyright coyote croquet cumbersome cutting cycle cylinder czech dabble daddy day dear dented divide don’t drown during dyke each ebb eek ensnare eons epiphany estuary etcetera etching equine ew fabric farming feared filler fizzy fjord fluid foggy foxxy frontal fungal gaggle geared gifted gong gnome grubby gush happened happiness hellish hinge hope hungry hyphen ian icy idiot i’m impossible intolerant iota it’s irritant i’ve jazzy jagged jenga jill joint just kangaroo kettle kitchen kookaburra kong laboratory landing left likely lilac little loco lolly lover’s luna luxurious lying master metres miss moonlight morph mr mrs ms mummy nasal neanderthal necessarily nine nifty nonsense noon numb oar obfuscate occult oddly often oh okay omission oscillate ozone parallel pang pear phase picnic pneumonic poppy porous psychology punch pygmy quantum queen quince quota radii rafferty rattle reassure resist retiree rice roommate running sassafras savvy scent scuttle seismic shamed shining sieve sister skink slump snide soup spire stay subject sultana svelte swiftly swung tallied tattooed tension the theatre title totally trekked tutor twenty tying vacuum variable vent vivid void vulnerable vying waffle wally warranted water weather whale winch withheld worry wurst wysiwyg wyvern xavier xenon xmas xylophone yak yeah yip you’re yuck zac zeal zigzag zing zodiac zoo

Aaron Abduct Accidental Adjacent Aeron Afghan After Agnostic Aint Anaheim And Anybody Although Allotted Ambidextrous Amend Announced Aqua Arrangement Ask Aspin Ate Attitude Authorised Avant Avery Award Axolotl Baby Baghdad Banana Balter Batty Baste Beeped Bent Binded Billow Bizarre Blood Bottle Bowwow Boyfriend Builder Bubbly Buzzing Byproduct Bystander Byzantine Cappuccino Cattle Cent Chant Cicero Close Coccyx Cooked Copyright Coyote Croquet Cumbersome Cutting Cycle Cylinder Czech Dabble Daddy Day Dear Dented Divide Don’T Drown During Dyke Each Ebb Eek Ensnare Eons Epiphany Estuary Etcetera Etching Equine Ew Fabric Farming Feared Filler Fizzy Fjord Fluid Foggy Foxxy Frontal Fungal Gaggle Geared Gifted Gong Gnome Grubby Gush Happened Happiness Hellish Hinge Hope Hungry Hyphen Ian Icy Idiot I’M Impossible Intolerant Iota It’S Irritant I’Ve Jazzy Jagged Jenga Jill Joint Just Kangaroo Kettle Kitchen Kookaburra Kong Laboratory Landing Left Likely Lilac Little Loco Lolly Lover’S Luna Luxurious Lying Master Metres Miss Moonlight Morph Mr Mrs Ms Mummy Nasal Neanderthal Necessarily Nine Nifty Nonsense Noon Numb Oar Obfuscate Occult Oddly Often Oh Okay Omission Oscillate Ozone Parallel Pang Pear Phase Picnic Pneumonic Poppy Porous Psychology Punch Pygmy Quantum Queen Quince Quota Radii Rafferty Rattle Reassure Resist Retiree Rice Roommate Running Sassafras Savvy Scent Scuttle Seismic Shamed Shining Sieve Sister Skink Slump Snide Soup Spire Stay Subject Sultana Svelte Swiftly Swung Tallied Tattooed Tension The Theatre Title Totally Trekked Tutor Twenty Tying Vacuum Variable Vent Vivid Void Vulnerable Vying Waffle Wally Warranted Water Weather Whale Winch Withheld Worry Wurst Wysiwyg Wyvern Xavier Xenon Xmas Xylophone Yak Yeah Yip You’Re Yuck Zac Zeal Zigzag Zing Zodiac Zoo

AARON ABDUCT ACCIDENTAL ADJACENT AERON AFGHAN AFTER AGNOSTIC AINT ANAHEIM AND ANYBODY ALTHOUGH ALLOTTED AMBIDEXTROUS AMEND ANNOUNCED AQUA ARRANGEMENT ASK ASPIN ATE ATTITUDE AUTHORISED AVANT AVERY AWARD AXOLOTL BABY BAGHDAD BANANA BALTER BATTY BASTE BEEPED BENT BINDED BILLOW BIZARRE BLOOD BOTTLE BOWWOW BOYFRIEND BUILDER BUBBLY BUZZING BYPRODUCT BYSTANDER BYZANTINE CAPPUCCINO CATTLE CENT CHANT CICERO CLOSE COCCYX COOKED COPYRIGHT COYOTE CROQUET CUMBERSOME CUTTING CYCLE CYLINDER CZECH DABBLE DADDY DAY DEAR DENTED DIVIDE DON’T DROWN DURING DYKE EACH EBB EEK ENSNARE EONS EPIPHANY ESTUARY ETCETERA ETCHING EQUINE EW FABRIC FARMING FEARED FILLER FIZZY FJORD FLUID FOGGY FOXXY FRONTAL FUNGAL GAGGLE GEARED GIFTED GONG GNOME GRUBBY GUSH HAPPENED HAPPINESS HELLISH HINGE HOPE HUNGRY HYPHEN IAN ICY IDIOT I’M IMPOSSIBLE INTOLERANT IOTA IT’S IRRITANT I’VE JAZZY JAGGED JENGA JILL JOINT JUST KANGAROO KETTLE KITCHEN KOOKABURRA KONG LABORATORY LANDING LEFT LIKELY LILAC LITTLE LOCO LOLLY LOVER’S LUNA LUXURIOUS LYING MASTER METRES MISS MOONLIGHT MORPH MR MRS MS MUMMY NASAL NEANDERTHAL NECESSARILY NINE NIFTY NONSENSE NOON NUMB OAR OBFUSCATE OCCULT ODDLY OFTEN OH OKAY OMISSION OSCILLATE OZONE PARALLEL PANG PEAR PHASE PICNIC PNEUMONIC POPPY POROUS PSYCHOLOGY PUNCH PYGMY QUANTUM QUEEN QUINCE QUOTA RADII RAFFERTY RATTLE REASSURE RESIST RETIREE RICE ROOMMATE RUNNING SASSAFRAS SAVVY SCENT SCUTTLE SEISMIC SHAMED SHINING SIEVE SISTER SKINK SLUMP SNIDE SOUP SPIRE STAY SUBJECT SULTANA SVELTE SWIFTLY SWUNG TALLIED TATTOOED TENSION THE THEATRE TITLE TOTALLY TREKKED TUTOR TWENTY TYING VACUUM VARIABLE VENT VIVID VOID VULNERABLE VYING WAFFLE WALLY WARRANTED WATER WEATHER WHALE WINCH WITHHELD WORRY WURST WYSIWYG WYVERN XAVIER XENON XMAS XYLOPHONE YAK YEAH YIP YOU’RE YUCK ZAC ZEAL ZIGZAG ZING ZODIAC ZOO

abide acorn of the habit dacron for the buddha gouda quaalude. bench bogus of the scribe robot for the aplomb jacob ribbon. census coral of the spiced jocose for the basic havoc soccer. demure docile of the tidbit lodger for the cuspid period bidder. ebbing echoing of the bushed decal for the apache anode needs. feeder focus of the lifer bedford for the serif proof buffer. gender gospel of the pigeon dogcart for the sprig quahog digger. herald honors of the dihedral madhouse for the penh riyadh bathhouse. ibsen iceman of the aphid nordic for the sushi saudi shiite. jennies jogger of the tijera adjourn for the oranj kowboj hajjis. keeper kosher of the shrike bookcase for the sheik logbook chukkas. lender locker of the child gigolo for the uncoil gambol enrolled. menace mccoy of the nimble tomcat for the denim random summon. nebula noshed of the inbred bronco for the cousin carbon kennel. obsess ocean of the phobic dockside for the gaucho libido hooded. pennies podium of the sniper opcode for the scrip bishop hopper. quanta qophs of the inquest oqos for the cinq coq suqqu. reduce rogue of the girdle orchid for the memoir sensor sorrel. senior sconce of the disbar godson for the hubris amends lessen. tendon torque of the united scotch for the nought forgot bitters. under ugliness of the rhubarb seduce for the manchu hindu continuum. versed vouch of the diver ovoid for the telaviv karpov flivver. wench worker of the unwed snowcap for the andrew escrow glowworm. xenon xochitl of the mixed boxcar for the suffix icebox exxon. yeoman yonder of the hybrid arroyo for the dinghy brandy sayyid. zebra zombie of the prized ozone for the franz arroz buzzing.

Abide Acorn Of The Habit Dacron For The Buddha Gouda Quaalude. Bench Bogus Of The Scribe Robot For The Aplomb Jacob Ribbon. Census Coral Of The Spiced Jocose For The Basic Havoc Soccer. Demure Docile Of The Tidbit Lodger For The Cuspid Period Bidder. Ebbing Echoing Of The Bushed Decal For The Apache Anode Needs. Feeder Focus Of The Lifer Bedford For The Serif Proof Buffer. Gender Gospel Of The Pigeon Dogcart For The Sprig Quahog Digger. Herald Honors Of The Dihedral Madhouse For The Penh Riyadh Bathhouse. Ibsen Iceman Of The Aphid Nordic For The Sushi Saudi Shiite. Jennies Jogger Of The Tijera Adjourn For The Oranj Kowboj Hajjis. Keeper Kosher Of The Shrike Bookcase For The Sheik Logbook Chukkas. Lender Locker Of The Child Gigolo For The Uncoil Gambol Enrolled. Menace Mccoy Of The Nimble Tomcat For The Denim Random Summon. Nebula Noshed Of The Inbred Bronco For The Cousin Carbon Kennel. Obsess Ocean Of The Phobic Dockside For The Gaucho Libido Hooded. Pennies Podium Of The Sniper Opcode For The Scrip Bishop Hopper. Quanta Qophs Of The Inquest Oqos For The Cinq Coq Suqqu. Reduce Rogue Of The Girdle Orchid For The Memoir Sensor Sorrel. Senior Sconce Of The Disbar Godson For The Hubris Amends Lessen. Tendon Torque Of The United Scotch For The Nought Forgot Bitters. Under Ugliness Of The Rhubarb Seduce For The Manchu Hindu Continuum. Versed Vouch Of The Diver Ovoid For The Telaviv Karpov Flivver. Wench Worker Of The Unwed Snowcap For The Andrew Escrow Glowworm. Xenon Xochitl Of The Mixed Boxcar For The Suffix Icebox Exxon. Yeoman Yonder Of The Hybrid Arroyo For The Dinghy Brandy Sayyid. Zebra Zombie Of The Prized Ozone For The Franz Arroz Buzzing.

ABIDE ACORN OF THE HABIT DACRON FOR THE BUDDHA GOUDA QUAALUDE. BENCH BOGUS OF THE SCRIBE ROBOT FOR THE APLOMB JACOB RIBBON. CENSUS CORAL OF THE SPICED JOCOSE FOR THE BASIC HAVOC SOCCER. DEMURE DOCILE OF THE TIDBIT LODGER FOR THE CUSPID PERIOD BIDDER. EBBING ECHOING OF THE BUSHED DECAL FOR THE APACHE ANODE NEEDS. FEEDER FOCUS OF THE LIFER BEDFORD FOR THE SERIF PROOF BUFFER. GENDER GOSPEL OF THE PIGEON DOGCART FOR THE SPRIG QUAHOG DIGGER. HERALD HONORS OF THE DIHEDRAL MADHOUSE FOR THE PENH RIYADH BATHHOUSE. IBSEN ICEMAN OF THE APHID NORDIC FOR THE SUSHI SAUDI SHIITE. JENNIES JOGGER OF THE TIJERA ADJOURN FOR THE ORANJ KOWBOJ HAJJIS. KEEPER KOSHER OF THE SHRIKE BOOKCASE FOR THE SHEIK LOGBOOK CHUKKAS. LENDER LOCKER OF THE CHILD GIGOLO FOR THE UNCOIL GAMBOL ENROLLED. MENACE MCCOY OF THE NIMBLE TOMCAT FOR THE DENIM RANDOM SUMMON. NEBULA NOSHED OF THE INBRED BRONCO FOR THE COUSIN CARBON KENNEL. OBSESS OCEAN OF THE PHOBIC DOCKSIDE FOR THE GAUCHO LIBIDO HOODED. PENNIES PODIUM OF THE SNIPER OPCODE FOR THE SCRIP BISHOP HOPPER. QUANTA QOPHS OF THE INQUEST OQOS FOR THE CINQ COQ SUQQU. REDUCE ROGUE OF THE GIRDLE ORCHID FOR THE MEMOIR SENSOR SORREL. SENIOR SCONCE OF THE DISBAR GODSON FOR THE HUBRIS AMENDS LESSEN. TENDON TORQUE OF THE UNITED SCOTCH FOR THE NOUGHT FORGOT BITTERS. UNDER UGLINESS OF THE RHUBARB SEDUCE FOR THE MANCHU HINDU CONTINUUM. VERSED VOUCH OF THE DIVER OVOID FOR THE TELAVIV KARPOV FLIVVER. WENCH WORKER OF THE UNWED SNOWCAP FOR THE ANDREW ESCROW GLOWWORM. XENON XOCHITL OF THE MIXED BOXCAR FOR THE SUFFIX ICEBOX EXXON. YEOMAN YONDER OF THE HYBRID ARROYO FOR THE DINGHY BRANDY SAYYID. ZEBRA ZOMBIE OF THE PRIZED OZONE FOR THE FRANZ ARROZ BUZZING.
