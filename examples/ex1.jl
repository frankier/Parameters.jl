using Parameters



@with_kw immutable PhysicalPara{R,I} <: Paras{R,I}
    rw::R = 1000.
    ri::R = 900.
    k::R = 0.05
    L::R = 3.34e5
    g::R = 9.81
    cw::R = 4220.
    ct::R = 7.5e-8 # pressure melt coefficient
    day::R = 24*3600.
    A::R = 2.5e-25
    alpha::R = 5/4
end
function PhysicalPara{R,I}(pp::PhysicalPara{R,I}; kws...)
    kargs = type2dict(pp)
    for (k,w) in kws
        kargs[k] = w
    end
    PhysicalPara{R,I}(;kargs...)
end

pp = PhysicalPara{Float64,Int}()
                  
# @with_kw immutable DerivedPhysicalPara
#     gamma ::R = ct*cw*rw
#     kappa::R = (gamma-1)/gamma
# end
