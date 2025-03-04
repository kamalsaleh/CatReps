#! @BeginChunk DecomposeOnce

LoadPackage( "CatReps" );

#! @BeginExample
c3c3 := ConcreteCategoryForCAP( [ [2,3,1], [4,5,6], [,,,5,6,4] ] );
#! A finite concrete category
AsFpCategory( c3c3 );
#! FreeCategory( RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) / relations
GF3 := HomalgRingOfIntegers( 3 );
#! GF(3)
A := GF3[c3c3];
#! Algebroid( GF(3), FreeCategory(
#! RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) ) / relations
IsLinearClosureOfACategory( A );
#! true
CatReps := FunctorCategory( A, GF3 );
#! FunctorCategory( Algebroid( GF(3), FreeCategory(
#! RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) ) / relations,
#! Category of matrices over GF(3) )
d := [[1,1,0,0,0],[0,1,1,0,0],[0,0,1,0,0],[0,0,0,1,1],[0,0,0,0,1]];;
e := [[0,1,0,0],[0,0,1,0],[0,0,0,0],[0,1,0,1],[0,0,1,0]];;
f := [[1,1,0,0],[0,1,1,0],[0,0,1,0],[0,0,0,1]];;
nine := AsObjectInFunctorCategory( CatReps, [ 5, 4 ], [ d, e, f ] );
#! <(1)->5, (2)->4; (a)->5x5, (b)->5x4, (c)->4x4>
DecomposeOnceByRandomEndomorphism( nine );
#! fail
#! @EndExample

#! The above shows that our representation <C>nine</C> is
#! indecomposable (with a high probability).
#! We use the tensor product to generate another representation
#! <C>fortyone</C>, that is hopefully decomposable, and
#! inspect the two resulting embeddings <C>iota</C> and
#! <C>kappa</C>.

#! @BeginExample
fortyone := TensorProductOnObjects( nine, nine );
#! <(1)->25, (2)->16; (a)->25x25, (b)->25x16, (c)->16x16>
result := DecomposeOnceByRandomEndomorphism( fortyone );
#! [ <(1)->3x25, (2)->1x16>, <(1)->22x25, (2)->15x16> ]
iota := result[1];
#! <(1)->3x25, (2)->1x16>
kappa := result[2];
#! <(1)->22x25, (2)->15x16>
Display( fortyone );
#! Image of <(1)>:
#! A vector space object over GF(3) of dimension 25
#! 
#! Image of <(2)>:
#! A vector space object over GF(3) of dimension 16
#! 
#! Image of (1)-[{ Z(3)^0*(a) }]->(1):
#!  1 1 . . . 1 1 . . . . . . . . . . . . . . . . . .
#!  . 1 1 . . . 1 1 . . . . . . . . . . . . . . . . .
#!  . . 1 . . . . 1 . . . . . . . . . . . . . . . . .
#!  . . . 1 1 . . . 1 1 . . . . . . . . . . . . . . .
#!  . . . . 1 . . . . 1 . . . . . . . . . . . . . . .
#!  . . . . . 1 1 . . . 1 1 . . . . . . . . . . . . .
#!  . . . . . . 1 1 . . . 1 1 . . . . . . . . . . . .
#!  . . . . . . . 1 . . . . 1 . . . . . . . . . . . .
#!  . . . . . . . . 1 1 . . . 1 1 . . . . . . . . . .
#!  . . . . . . . . . 1 . . . . 1 . . . . . . . . . .
#!  . . . . . . . . . . 1 1 . . . . . . . . . . . . .
#!  . . . . . . . . . . . 1 1 . . . . . . . . . . . .
#!  . . . . . . . . . . . . 1 . . . . . . . . . . . .
#!  . . . . . . . . . . . . . 1 1 . . . . . . . . . .
#!  . . . . . . . . . . . . . . 1 . . . . . . . . . .
#!  . . . . . . . . . . . . . . . 1 1 . . . 1 1 . . .
#!  . . . . . . . . . . . . . . . . 1 1 . . . 1 1 . .
#!  . . . . . . . . . . . . . . . . . 1 . . . . 1 . .
#!  . . . . . . . . . . . . . . . . . . 1 1 . . . 1 1
#!  . . . . . . . . . . . . . . . . . . . 1 . . . . 1
#!  . . . . . . . . . . . . . . . . . . . . 1 1 . . .
#!  . . . . . . . . . . . . . . . . . . . . . 1 1 . .
#!  . . . . . . . . . . . . . . . . . . . . . . 1 . .
#!  . . . . . . . . . . . . . . . . . . . . . . . 1 1
#!  . . . . . . . . . . . . . . . . . . . . . . . . 1
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! Image of (1)-[{ Z(3)^0*(b) }]->(2):
#!  . . . . . 1 . . . . . . . . . .
#!  . . . . . . 1 . . . . . . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . 1 . 1 . . . . . . . .
#!  . . . . . . 1 . . . . . . . . .
#!  . . . . . . . . . 1 . . . . . .
#!  . . . . . . . . . . 1 . . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . . . . 1 . 1 . . . .
#!  . . . . . . . . . . 1 . . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . 1 . . . . . . . 1 . .
#!  . . . . . . 1 . . . . . . . 1 .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . 1 . 1 . . . . . 1 . 1
#!  . . . . . . 1 . . . . . . . 1 .
#!  . . . . . . . . . 1 . . . . . .
#!  . . . . . . . . . . 1 . . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . . . . 1 . 1 . . . .
#!  . . . . . . . . . . 1 . . . . .
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! Image of (2)-[{ Z(3)^0*(c) }]->(2):
#!  1 1 . . 1 1 . . . . . . . . . .
#!  . 1 1 . . 1 1 . . . . . . . . .
#!  . . 1 . . . 1 . . . . . . . . .
#!  . . . 1 . . . 1 . . . . . . . .
#!  . . . . 1 1 . . 1 1 . . . . . .
#!  . . . . . 1 1 . . 1 1 . . . . .
#!  . . . . . . 1 . . . 1 . . . . .
#!  . . . . . . . 1 . . . 1 . . . .
#!  . . . . . . . . 1 1 . . . . . .
#!  . . . . . . . . . 1 1 . . . . .
#!  . . . . . . . . . . 1 . . . . .
#!  . . . . . . . . . . . 1 . . . .
#!  . . . . . . . . . . . . 1 1 . .
#!  . . . . . . . . . . . . . 1 1 .
#!  . . . . . . . . . . . . . . 1 .
#!  . . . . . . . . . . . . . . . 1
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! An object in FunctorCategory( Algebroid( GF(3), FreeCategory(
#! RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) ) / relations,
#! Category of matrices over GF(3) ) given by the above data
S := DirectSum( [ Source( iota ), Source( kappa ) ] );
#! <(1)->25, (2)->16; (a)->25x25, (b)->25x16, (c)->16x16>
Display( S );
#! Image of <(1)>:
#! A vector space object over GF(3) of dimension 25
#! 
#! Image of <(2)>:
#! A vector space object over GF(3) of dimension 16
#! 
#! Image of (1)-[{ Z(3)^0*(a) }]->(1):
#!  . 2 . . . . . . . . . . . . . . . . . . . . . . .
#!  1 2 2 . . . . . . . . . . . . . . . . . . . . . .
#!  . . 1 . . . . . . . . . . . . . . . . . . . . . .
#!  . . . 1 1 . . . 1 1 . . . . . . . . . . . . . . .
#!  . . . . 1 1 . . . 1 1 . . . . . . . . . . . . . .
#!  . . . . . 1 . . . . 1 . . . . . . . . . . . . . .
#!  . . . . . . 1 1 . . . 1 1 . . . . . . . . . . . .
#!  . . . . . . . 1 . . . . 1 . . . . . . . . . . . .
#!  . . . . . . . . 1 1 . . . 1 1 . . . . . . . . . .
#! . . . . . . . . . 1 1 . . . 1 1 . . . . . . . . .
#! . . . . . . . . . . 1 . . . . 1 . . . . . . . . .
#! . . . . . . . . . . . 1 1 . . . 1 1 . . . . . . .
#! . . . . . . . . . . . . 1 . . . . 1 . . . . . . .
#! . . . . . . . . . . . . . 1 1 . . . . . . . . . .
#! . . . . . . . . . . . . . . 1 1 . . . . . . . . .
#! . . . . . . . . . . . . . . . 1 . . . . . . . . .
#! . . . . . . . . . . . . . . . . 1 1 . . . . . . .
#! . . . . . . . . . . . . . . . . . 1 . . . . . . .
#! . . . . . . . . . . . . . . . . . . 1 1 . 1 1 . .
#! . . . . . . . . . . . . . . . . . . . 1 1 . 1 1 .
#! . . . . . . . . . . . . . . . . . . . . 1 . . 1 .
#! . . . . . . . . . . . . . . . . . . . . . 1 1 . .
#! . . . . . . . . . . . . . . . . . . . . . . 1 1 .
#! . . . . . . . . . . . . . . . . . . . . . . . 1 .
#! . . . . . . . . . . . . . . . . . . . . . . . . 1
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! Image of (1)-[{ Z(3)^0*(b) }]->(2):
#!  2 . . . . . . . . . . . . . . .
#!  1 . . . . . . . . . . . . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . 1 . . . . . . . . .
#!  . . . . . . . 1 . . . . . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . 1 . 1 . . . . . . .
#!  . . . . . . . 1 . . . . . . . .
#!  . . . . . . . . . . 1 . . . . .
#!  . . . . . . . . . . . 1 . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . . . . . 1 . 1 . . .
#!  . . . . . . . . . . . 1 . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . 1 . . . . . . . 1 .
#!  . . . . . . . 1 . . . . . . . 1
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . . . . . 1 . . . . .
#!  . . . . . . . . . . . 1 . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . . 2 . . 1 . 1 . . 2
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! Image of (2)-[{ Z(3)^0*(c) }]->(2):
#!  1 . . . . . . . . . . . . . . .
#!  . 1 1 . . 1 1 . . . . . . . . .
#!  . . 1 1 . . 1 1 . . . . . . . .
#!  . . . 1 . . . 1 . . . . . . . .
#!  . . . . 1 . . . 1 . . . . . . .
#!  . . . . . 1 1 . . 1 1 . . . . .
#!  . . . . . . 1 1 . . 1 1 . . . .
#!  . . . . . . . 1 . . . 1 . . . .
#!  . . . . . . . . 1 . . . 1 . . .
#!  . . . . . . . . . 1 1 . . . . .
#!  . . . . . . . . . . 1 1 . . . .
#!  . . . . . . . . . . . 1 . . . .
#!  . . . . . . . . . . . . 1 . . .
#!  . . . . . . . . . . . . . 1 1 .
#!  . . . . . . . . . . . . . . 1 1
#!  . . . . . . . . . . . . . . . 1
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! An object in FunctorCategory( Algebroid( GF(3), FreeCategory(
#! RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) ) / relations,
#! Category of matrices over GF(3) ) given by the above data
#! @EndExample

#! Comparing the matrices of <C>fortyone</C> with those of 
#! <C>S</C>, we see
#! that after decomposing once, we have separated one small
#! matrix on the diagonal: A $3\times 3$-matrix from <C>S(A.a)</C>,
#! a $3 \times 1$-matrix from <C>S(A.b)</C> and a $1\times 1$-matrix
#! from <C>S(A.c)</C>. This matches with the source of the embedding <C>iota</C>.

#! @BeginExample
Display( iota );
#! Image of <(1)>:
#!  2 2 . 1 1 . . . . . . . . . . 1 2 1 2 1 . . . . .
#!  1 2 1 2 1 1 2 1 2 1 . . . . . 2 . . 1 . 2 . . 1 .
#!  . . 2 . . . 1 2 . 2 2 . . 1 . . . 1 . . . 2 . . 1
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! Image of <(2)>:
#!  . . . . . . . . . . . . . . . 1
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! A morphism in FunctorCategory( Algebroid( GF(3), FreeCategory(
#! RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) ) / relations,
#! Category of matrices over GF(3) ) given by the above data
Display( Source( iota ) );
#! Image of <(1)>:
#! A vector space object over GF(3) of dimension 3
#! 
#! Image of <(2)>:
#! A vector space object over GF(3) of dimension 1
#! 
#! Image of (1)-[{ Z(3)^0*(a) }]->(1):
#!  . 2 .
#!  1 2 2
#!  . . 1
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! Image of (1)-[{ Z(3)^0*(b) }]->(2):
#!  2
#!  1
#!  .
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! Image of (2)-[{ Z(3)^0*(c) }]->(2):
#!  1
#! 
#! A morphism in Category of matrices over GF(3)
#!
#! An object in FunctorCategory( Algebroid( GF(3), FreeCategory(
#! RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) ) / relations,
#! Category of matrices over GF(3) ) given by the above data
#! @EndExample

#! We can then look at the other embedding of the direct sum 
#! decomposition, <C>kappa</C>. The iteration of 
#! <C>WeakDirectSumDecomposition</C> will continue then
#! with <C>Source( kappa )</C>. Each time the random
#! endomorphism will decompose the representation,
#! lowering the dimensions of each object at most by $3$.

#! @Example
Source( kappa );
#! <(1)->22, (2)->15; (a)->22x22, (b)->22x15, (c)->15x15>
result2 := DecomposeOnceByRandomEndomorphism( Source( kappa ) );
#! [ <(1)->3x22, (2)->3x15>, <(1)->19x22, (2)->12x15> ]
#! @EndExample
#! @EndChunk
