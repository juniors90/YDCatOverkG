#! @Chapter The Drinfeld double of a group algebra
#!
#! @Section Define a Delta Function for an element of G
#!
#! @BeginExampleSession
#! gap> LoadPackage("YDCatOverkG", "0", false);
#! true
#! gap> G:=SymmetricGroup(3);;
#! gap> elmsG := Elements(G);
#! [ (), (2,3), (1,2), (1,2,3), (1,3,2), (1,3) ]
#! gap> D_G2G2 := DeltaFunctionForElementOfG( G.2^2 , Rationals );;  # ()
#! gap> D_G1G2 := DeltaFunctionForElementOfG( G.1*G.2, Rationals );; # (2,3)
#! gap> D_G2   := DeltaFunctionForElementOfG( G.2, Rationals );;     # (1,2)
#! gap> D_G1   := DeltaFunctionForElementOfG( G.1, Rationals );;     # (1,2,3)
#! gap> D_G1G1 := DeltaFunctionForElementOfG( G.1^2, Rationals );;   # (1,3,2)
#! gap> D_G2G1 := DeltaFunctionForElementOfG( G.2*G.1, Rationals );; # (1,3)
#! gap> D_G1(G.1);
#! 1
#! gap> D_G1(G.2);
#! 0
#! gap> D_G2((1,3,2));
#! 0
#! gap> D_G1G2((1,2));
#! 0
#! gap> D_G1G1((1,2,3));
#! 0
#! gap> D_G1G2((2,3));
#! 1
#! gap> G.1;
#! (1,2,3)
#! gap> simple1:=SimplesModAttachedToElement( G, G.1 )[1];
#! <Simple D(G)-Module with Weight ( (1,2,3) , rho )>
#! gap> Print(simple1);
#! Weight = 
#!  g = (1,2,3), 
#!  rho = [ (1,2,3) ] -> [ [ [ 1 ] ] ]
#! M(g, rho) = [ (1,2,3), (1,2) ] -> [ [ [ 1, 0 ], [ 0, 1 ] ], [ [ 0, 1 ], [ 1, 0\
#!  ] ] ]
#! Base = [ ( () , [ 1 ] ), ( (2,3) , [ 1 ] ) ]
#! G = Sym( [ 1 .. 3 ] )
#! Structure Description of G = S3
#! G_g = Alt( [ 1 .. 3 ] )
#! Structure Description of G_g = C3
#! gap> ActionkGdualOnYDModule(D_G1, simple1, simple1!.Base[1] );
#! ( () , [ 1 ] )
#! gap> ActionkGdualOnYDModule( D_G1, simple1, simple1!.Base[2] );
#! 0
#! gap> matrix_DG1 := StructureMatrixSimpleModule( D_G1, simple1 );
#! [ [ 1, 0 ], [ 0, 0 ] ]
#! gap> Display( matrix_DG1 );
#! [ [  1,  0 ],
#!   [  0,  0 ] ]
#! gap> Print(simple1);
#! Weight = 
#!  g = (1,2,3), 
#!  rho = [ (1,2,3) ] -> [ [ [ 1 ] ] ]
#! M(g, rho) = [ (1,2,3), (1,2) ] -> [ [ [ 1, 0 ], [ 0, 1 ] ], [ [ 0, 1 ], [ 1, 0\
#!  ] ] ]
#! Base = [ ( () , [ 1 ] ), ( (2,3) , [ 1 ] ) ]
#! G = Sym( [ 1 .. 3 ] )
#! Structure Description of G = S3
#! G_g = Alt( [ 1 .. 3 ] )
#! Structure Description of G_g = C3
#! gap> for elmsG in Elements(G) do
#! >      delta := DeltaFunctionForElementOfG( elmsG , Rationals );
#! >      M := StructureMatrixSimpleModule( delta, simple1);
#! >      Print("Matrix of Delta_", elmsG, ": ", M, " \n");
#! > od;
#! Matrix of Delta_(): [ [ 0, 0 ], [ 0, 0 ] ] 
#! Matrix of Delta_(2,3): [ [ 0, 0 ], [ 0, 0 ] ] 
#! Matrix of Delta_(1,2): [ [ 0, 0 ], [ 0, 0 ] ] 
#! Matrix of Delta_(1,2,3): [ [ 1, 0 ], [ 0, 0 ] ] 
#! Matrix of Delta_(1,3,2): [ [ 0, 0 ], [ 0, 1 ] ] 
#! Matrix of Delta_(1,3): [ [ 0, 0 ], [ 0, 0 ] ] 
#! @EndExampleSession
