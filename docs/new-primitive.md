now that we have the function we have to
1. copy the ultrascale plus.yml file into a new file
2. Change the architecture to use the dsp48e1 rather than e2 (and also get rid of the LUTs. Rememeber, we're thinking that
    this is the old architecture that doesnt have the luts, just the dsp48e1!)
3. The semantics of the dsp48e1 after the import should be added to main.rkt's dictionary with the associated module_name
   parameters and ports section are symbolic, these should correspond to the original DSP sim model, as this is what is 
   used to get hte correct ports and parameters (i.e. ignore the changes you made, what does the dsp docs say it should be)
   everything is symbolic at first, but we can narrow down values to decrease the search space when we realize we don't 
   want to support some certain functionality.
4. 