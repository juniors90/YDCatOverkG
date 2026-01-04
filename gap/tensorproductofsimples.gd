#! @Chapter Utilities
#!
#! @Section Kronecker Product
#!
#! @Arguments A, B
#!
#! @Returns matrix
#!
#! @Description
#!
#! Computes the tensor (Kronecker) product of two matrices <A>A</A> and <A>B</A>.
#! The implementation is optimized for speed and has been observed to
#! outperform GAP's <A>KroneckerProduct</A> in tests with moderately large matrices.
#! 
DeclareGlobalFunction( "TensorProductOfMat" );

#! @Chapter Object of Yetter–Drinfeld categories over group algebras.
#!
#! @Section Tensor Product Of Simple
#!
#! @Arguments simple1, simple2
#!
#! @Returns record
#!
#! @Description
#!
#! Computes the tensor (Kronecker) product of two matrices <A>A</A> and <A>B</A>.
#! The implementation is optimized for speed and has been observed to
#! outperform GAP's <A>KroneckerProduct</A> in tests with moderately large matrices.
#! 
DeclareGlobalFunction( "TensorProductOfSimplesModYD" );
#!
#! @InsertChunk Example_TensorProductOfSimplesModYD
#!