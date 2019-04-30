// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

// rcpp_Wilcoxon_PermTest_Given_Permutations
List rcpp_Wilcoxon_PermTest_Given_Permutations(NumericVector X, IntegerMatrix Y);
RcppExport SEXP _wcomp_rcpp_Wilcoxon_PermTest_Given_Permutations(SEXP XSEXP, SEXP YSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericVector >::type X(XSEXP);
    Rcpp::traits::input_parameter< IntegerMatrix >::type Y(YSEXP);
    rcpp_result_gen = Rcpp::wrap(rcpp_Wilcoxon_PermTest_Given_Permutations(X, Y));
    return rcpp_result_gen;
END_RCPP
}
// rcpp_TwoPartTest_Given_Permutations
List rcpp_TwoPartTest_Given_Permutations(NumericVector X, IntegerMatrix Y);
RcppExport SEXP _wcomp_rcpp_TwoPartTest_Given_Permutations(SEXP XSEXP, SEXP YSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericVector >::type X(XSEXP);
    Rcpp::traits::input_parameter< IntegerMatrix >::type Y(YSEXP);
    rcpp_result_gen = Rcpp::wrap(rcpp_TwoPartTest_Given_Permutations(X, Y));
    return rcpp_result_gen;
END_RCPP
}
// rcpp_Compute_Wilcoxon_Signed_Rank_Stat
NumericVector rcpp_Compute_Wilcoxon_Signed_Rank_Stat(NumericVector RankedDifferences, IntegerVector SecondGroupBigger);
RcppExport SEXP _wcomp_rcpp_Compute_Wilcoxon_Signed_Rank_Stat(SEXP RankedDifferencesSEXP, SEXP SecondGroupBiggerSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericVector >::type RankedDifferences(RankedDifferencesSEXP);
    Rcpp::traits::input_parameter< IntegerVector >::type SecondGroupBigger(SecondGroupBiggerSEXP);
    rcpp_result_gen = Rcpp::wrap(rcpp_Compute_Wilcoxon_Signed_Rank_Stat(RankedDifferences, SecondGroupBigger));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_wcomp_rcpp_Wilcoxon_PermTest_Given_Permutations", (DL_FUNC) &_wcomp_rcpp_Wilcoxon_PermTest_Given_Permutations, 2},
    {"_wcomp_rcpp_TwoPartTest_Given_Permutations", (DL_FUNC) &_wcomp_rcpp_TwoPartTest_Given_Permutations, 2},
    {"_wcomp_rcpp_Compute_Wilcoxon_Signed_Rank_Stat", (DL_FUNC) &_wcomp_rcpp_Compute_Wilcoxon_Signed_Rank_Stat, 2},
    {NULL, NULL, 0}
};

RcppExport void R_init_wcomp(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
