#
# YDCatOverkG: Compute simples object for the Yetter-Drinfeld Categories over Group Algebras.
#
# This file contains package meta data. For additional information on
# the meaning and correct usage of these fields, please consult the
# manual of the "Example" package as well as the comments in its
# PackageInfo.g file.
#
SetPackageInfo( rec(

PackageName := "YDCatOverkG",
Subtitle := "Compute simples object for the Yetter-Drinfeld Categories over Group Algebras.",
Version := "0.1",
Date := "31/12/2025", # dd/mm/yyyy format
License := "GPL-2.0-or-later",

Persons := [
  rec(
    FirstNames := "Juan David",
    LastName := "Ferreira",
    WWWHome := "https://gitlab.com/juniors90/",
    Email := "juandavid9a0@gmail.com",
    IsAuthor := true,
    IsMaintainer := true,
    PostalAddress := "5000",
    Place := "Cordoba - Argentina",
    Institution := "Center of Research and Studies in Mathematics - National University of Cordoba",
  ),
],

SourceRepository := rec(
    Type := "git",
    URL := "https://github.com/juniors90/YDCatOverkG",
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
PackageWWWHome  := "https://juniors90.github.io/YDCatOverkG/",
PackageInfoURL  := Concatenation( ~.PackageWWWHome, "PackageInfo.g" ),
README_URL      := Concatenation( ~.PackageWWWHome, "README.md" ),
ArchiveURL      := Concatenation( ~.SourceRepository.URL,
                                 "/releases/download/v", ~.Version,
                                 "/", ~.PackageName, "-", ~.Version ),

ArchiveFormats := ".tar.gz",

##  Status information. Currently the following cases are recognized:
##    "accepted"      for successfully refereed packages
##    "submitted"     for packages submitted for the refereeing
##    "deposited"     for packages for which the GAP developers agreed
##                    to distribute them with the core GAP system
##    "dev"           for development versions of packages
##    "other"         for all other packages
##
Status := "dev",

AbstractHTML   :=  "",

PackageDoc := rec(
  BookName  := "YDCatOverkG",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0_mj.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "Compute simples object for the Yetter-Drinfeld Categories over Group Algebras.",
),

Dependencies := rec(
  GAP := ">= 4.11",
  NeededOtherPackages := [ [ "GAPDoc", ">= 1.6.1" ],
                           [ "Repsn", ">= 3.1.0" ],
                           [ "RepnDecomp", ">= 1.1.0" ] ],
  SuggestedOtherPackages := [ [ "IO", ">= 4.7.0" ] ],
  ExternalConditions := [ ],
),

AvailabilityTest := ReturnTrue,

TestFile := "tst/testall.g",

Keywords := [
              "Yetter-Drinfeld categories",
              "Hopf algebra",
              "Group algebras",
              "Representation theory"
            ],

AutoDoc := rec(
    entities := rec(
        VERSION := ~.Version,
        DATE := ~.Date,
        io := "<Package>io</Package>",
        PackageName := "<Package>PackageName</Package>",
    ),
    TitlePage := rec(
        Copyright := Concatenation(
            "&copyright; 2025-2026 by Juan David Ferreira<P/>\n\n",
            "This package may be distributed under the terms and conditions ",
            "of the GNU Public License Version 2 or (at your option) any later version.\n"
            ),
        Abstract := Concatenation(
            "&YDCatOverkG; is a &GAP; package that allows you to compute ",
            "the simple objects of the Yetter–Drinfeld categories over ",
            "group algebras.\n"
            ),
        Acknowledgements := Concatenation(
            "This package was initiated during my Ph.D. studies. ",
            "I am grateful to my Ph.D. advisor, ",
            "Agustín García Iglesias, for his guidance and insightful ",
            "comments that helped shape this work.",
            "<P/>\n\n",
            "This documentation was prepared using the ",
            "&GAPDoc; package <Cite Key='GAPDoc'/>.\n",
            "<P/>\n"
            ),
    ),
),

));


