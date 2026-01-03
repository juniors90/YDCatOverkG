#! @Chapter Basis for Yetter-Drinfeld module
#!
#! @Section Finding a Simples Modules attached to Element
#!
#! @BeginChunk Example_SimplesModAttachedToElement
#! @BeginExampleSession
#! gap> LoadPackage("YDCatOverkG", "0", false);
#! true
#! gap> G:=SymmetricGroup(3);
#! Sym( [ 1 .. 3 ] )
#! gap> repCC:= List(ConjugacyClasses(G), Representative);
#! [ (), (1,2), (1,2,3) ]
#! gap> simples_attached_to_e := SimplesModAttachedToElement( G, repCC[1] );
#! [ <Simple D(G)-Module with Weight ( () , rho )>, 
#!   <Simple D(G)-Module with Weight ( () , rho )>, 
#!   <Simple D(G)-Module with Weight ( () , rho )> ]
#! gap> simples_attached_to_12 := SimplesModAttachedToElement( G, repCC[2] );
#! [ <Simple D(G)-Module with Weight ( (1,2) , rho )>, 
#!   <Simple D(G)-Module with Weight ( (1,2) , rho )> ]
#! gap> simples_attached_to_123 := SimplesModAttachedToElement( G, repCC[2] );
#! [ <Simple D(G)-Module with Weight ( (1,2) , rho )>, 
#!   <Simple D(G)-Module with Weight ( (1,2) , rho )> ]
#! @EndExampleSession
#! @EndChunk
