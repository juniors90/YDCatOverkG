#! @Chapter Basis for Yetter-Drinfeld module
#!
#! @Section Finding a Simples Modules attached to Element
#!
#! @BeginChunk Example_GetCentralizerOfElement
#! @BeginExampleSession
#! gap> LoadPackage("YDCatOverkG", "0", false);
#! true
#! gap> G := SymmetricGroup(3);
#! Sym( [ 1 .. 3 ] )
#! gap> repsCC := List(ConjugacyClasses(G), Representative);
#! [ (), (1,2), (1,2,3) ]
#! gap> G_e := GetCentralizerOfElement(G, repsCC[1] );
#! rec( G := Sym( [ 1 .. 3 ] ), centralizer := S3, centralizerSize := 6, 
#!   classSize := 1, g := (), structure := "S3" )
#! gap> SimplesModByCentralizer(G_e);
#! [ <Simple D(G)-Module with Weight ( () , rho )>, 
#!   <Simple D(G)-Module with Weight ( () , rho )>, 
#!   <Simple D(G)-Module with Weight ( () , rho )> ]
#! @EndExampleSession
#! @EndChunk