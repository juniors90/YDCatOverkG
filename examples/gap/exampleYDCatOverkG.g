#! @Chapter Object of Yetter-Drinfeld categories over group algebras.
#!
#! @Section example for SimplesModYD object
#!
#! This section illustrates the construction of simple Yetter--Drinfeld
#! modules over the group algebra $kG$ for $G = S_4$
#!
#! @BeginExampleSession
#! gap> LoadPackage("YDCatOverkG", "0", false);
#! true
#! gap> simples:= [];;
#! gap> S4 := SymmetricGroup(4);
#! Sym( [ 1 .. 4 ] )
#! gap> repsCC:=List(ConjugacyClasses(S4), Representative);
#! [ (), (1,2), (1,2)(3,4), (1,2,3), (1,2,3,4) ]
#! gap> g := repsCC[3];
#! (1,2)(3,4)
#! gap> S4_g := Centralizer( S4, g );
#! Group([ (1,2), (1,3)(2,4), (3,4) ])
#! gap> irrepsS4_g := Irr( S4_g  );;
#! gap> for chi in irrepsS4_g do
#! > rho := IrreducibleAffordingRepresentation( chi );
#! > weight := rec( g := g, rho := rho );
#! > Add( simples, SimplesModYD( S4, weight) );
#! > od;
#! @EndExampleSession
