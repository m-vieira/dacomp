test_that("Test wcomp test function", {
  cat(paste0('\n\r'))
  
  
  if(!exists('DO_MAIN_TESTING'))
    skip('DO_MAIN_TESTING not defined, skipping')
  if(!DO_MAIN_TESTING   )
    skip('DO_MAIN_TESTING is false, skipping')
  
  set.seed(1)
  
  ###************************************************
  #generate data:
  ###************************************************
  
  data = wcomp.generate_example_dataset(m1 = 100,
                                        n_X = 50,
                                        n_Y = 50,
                                        signal_strength_as_change_in_microbial_load = 0.1)
  
  result.selected.references = wcomp.select_references(X = data$counts,
                                                       median_SD_threshold = 0.6, 
                                                       verbose = F)
  
  
  q_BH = q_DSFDR = 0.1
  
  
  
  ###************************************************
  #check inputs
  ###************************************************
  expect_error(wcomp.test(X = data$counts+0.5,
                          y = data$group_labels,
                          ind_reference_taxa = result.selected.references$selected_references,verbose = F,q = q_DSFDR),info = "counts are not integers")
  
  expect_error(wcomp.test(X = NA,
                          y = data$group_labels,
                          ind_reference_taxa = result.selected.references$selected_references,verbose = F,q = q_DSFDR),info = "counts are not matrix")
  
  expect_error(wcomp.test(X = data$counts,
                          y = data$group_labels[-1],
                          ind_reference_taxa = result.selected.references$selected_references,verbose = F,q = q_DSFDR),info = "labels not same length as counts")
  
  expect_error(wcomp.test(X = data$counts,
                          y = data$group_labels,
                          ind_reference_taxa = -1,verbose = F,q = q_DSFDR),info = "reference taxa must be subset of 1:ncol(X)")
  
  expect_error(wcomp.test(X = data$counts,
                          y = data$group_labels,
                          ind_reference_taxa = result.selected.references$selected_references,verbose = NA,q = q_DSFDR),info = "verbose must be logical")
  
  expect_error(wcomp.test(X = data$counts,
                          y = data$group_labels,
                          ind_reference_taxa = result.selected.references$selected_references,verbose = F,q = -1),info = "q must be between 0 and 1")
  
  expect_warning(wcomp.test(X = data$counts,
                          y = data$group_labels,
                          ind_reference_taxa = result.selected.references$selected_references,verbose = F,q = 0.5),info = "abnormal value of q not detected")
  
  expect_error(wcomp.test(X = data$counts,
                            y = data$group_labels,
                            ind_reference_taxa = result.selected.references$selected_references,verbose = F,nr_perm = 50,q = q_DSFDR),info = "low number of permutations - nr_perm")
  
  expect_error(wcomp.test(X = data$counts,
                          y = data$group_labels,
                          ind_reference_taxa = result.selected.references$selected_references,verbose = F,nr_perms_reference_validation = 50,q = q_DSFDR),info = "low number of permutations - nr_perms_reference_validation")
  
  expect_error(wcomp.test(X = data$counts,
                          y = data$group_labels,
                          ind_reference_taxa = result.selected.references$selected_references,verbose = F,test =  'FOO_TEST',q = q_DSFDR),info = "invalid test")
  
  expect_error(wcomp.test(X = data$counts[-1,],
                          y = NULL,
                          ind_reference_taxa = result.selected.references$selected_references,verbose = F,test =  'SignedWilcoxon',q = q_DSFDR),info = "odd number of rows for paired test")
  
  expect_error(wcomp.test(X = data$counts,
                          y = data$group_labels,
                          ind_reference_taxa = result.selected.references$selected_references,verbose = F,test =  'SignedWilcoxon',q = q_DSFDR),info = "Y not null for paired test")
  
  expect_error(wcomp.test(X = data$counts,
                          y = c(data$group_labels[-1],3),
                          ind_reference_taxa = result.selected.references$selected_references,verbose = F,q = q_DSFDR),info = "More than two groups for two group test")
  
  expect_error(wcomp.test(X = data$counts,
                          y = c(data$group_labels[-1],NA),
                          ind_reference_taxa = result.selected.references$selected_references,verbose = F,q = q_DSFDR),info = "Missing labels in y (NA)")
  
  expect_error(wcomp.test(X = data$counts,
                          y = c(data$group_labels[-1],NaN),
                          ind_reference_taxa = result.selected.references$selected_references,verbose = F,q = q_DSFDR),info = "Missing labels in y (NaN)")
  
  expect_error(wcomp.test(X = data$counts,
                          y = data$group_labels,
                          ind_reference_taxa = result.selected.references$selected_references,verbose = F,disable_DSFDR = 1,q = q_DSFDR),info = "disable_DSFDR is not valid logical")
  
  
  ###************************************************
  #check returned class
  ###************************************************
  set.seed(1)
  result.test.with.class = wcomp.test(X = data$counts,
                           y = data$group_labels,
                           ind_reference_taxa = result.selected.references,verbose = F,q = q_DSFDR)
  set.seed(1)
  result.test = wcomp.test(X = data$counts,
                           y = data$group_labels,
                           ind_reference_taxa = result.selected.references$selected_references,verbose = F,q = q_DSFDR) # can also use for example , test = 'TwoPartWilcoxon', show example
  
  #check results identical
  expect_identical(result.test.with.class,result.test,info = "wcomp.test results with reference object and vector of indices for references not identical")
  ###************************************************
  #check returned fields
  ###************************************************
  
  expect_identical(names(result.test.with.class),c("test.reference.set.validity", "lambda","stats_matrix","p.values.test","rejected","dsfdr_threshold" ))
  
  expect_identical(sort(which(is.na(result.test.with.class$lambda))),sort(result.selected.references$selected_references),info = "check missing lambda are only the given references")
  
  expect_identical(sort(which(is.na(result.test.with.class$p.values.test))),sort(result.selected.references$selected_references),info = "check missing p.values are only the given references")
  
  ###************************************************
  #regression test
  ###************************************************
  library(digest)
  hash_computation_result = digest(result.test, algo="md5")
  cat(paste0('Current MD5 of sum results: ',hash_computation_result,'\n\r'))
  hash_gold_standard = "2304439ec05f9c5871b185749fb25251"
  expect_equal(hash_computation_result,hash_gold_standard)
})