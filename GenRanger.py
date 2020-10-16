def GenRanger(end, start=0, step=1):    
    """   
    Similar in use to standard python range() but without generating a list.
    """
    #checking positive convergence
    if end < start and step > 0:
        pass
    #checking negative convergence
    elif end > start and step < 0:
        pass
    #yielding
    else:
        index = start
        niter = abs(end)
        while niter > 0:
            yield index
            index += step
            niter -= abs(step)
