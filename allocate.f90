!***********************************************************************
!
  subroutine allocate_arrays
!
!***********************************************************************
!
  use parameters
  use geometry
  use indexes
  use variables
  use coef
  use coefb
  use hcoef
  use bc
  use time_mod
  use title_mod
  use statistics
  use nusselt
  use wall
  use inlet
  use gradients
  use omega_turb_models
 
  implicit none 
!
!***********************************************************************
!

!     Geometry
  allocate(x(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: x" 
  allocate(y(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: y" 
  allocate(z(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: z" 
  allocate(fx(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: fx" 
  allocate(fy(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: fy" 
  allocate(fz(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: fz" 
  allocate(xc(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: xc" 
  allocate(yc(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: yc" 
  allocate(zc(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: zc" 
  allocate(vol(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: vol"
  allocate(ar1x(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: ar1x" 
  allocate(ar1y(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: ar1y" 
  allocate(ar1z(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: ar1z" 
  allocate(ar2x(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: ar2x" 
  allocate(ar2y(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: ar2y" 
  allocate(ar2z(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: ar2z" 
  allocate(ar3x(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: ar3x" 
  allocate(ar3y(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: ar3y" 
  allocate(ar3z(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: ar3z" 
  allocate(wallDistance(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: wallDistance" 


  allocate(li(nx),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: li"
  allocate(lk(nz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: lk"

!     Coefficients
  allocate(ae(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: ae" 
  allocate(aw(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: aw" 
  allocate(an(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: an" 
  allocate(as(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: as" 
  allocate(at(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: at" 
  allocate(ab(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: ab" 
  allocate(ap(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: ap" 

  allocate(su(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: su" 
  allocate(sv(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: sv" 
  allocate(sw(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: sw" 

  allocate(sp(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: sp" 
  allocate(res(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: res" 
  allocate(spv(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: spv" 

  allocate(apu(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: apu" 
  allocate(apv(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: apv"
  allocate(apw(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: apw"

!     Variables
  ! Velocities 
  allocate(u(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: u" 
  allocate(v(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: v" 
  allocate(w(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: w" 
  ! Mass flows
  allocate(f1(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: f1" 
  allocate(f2(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: f2" 
  allocate(f3(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: f3" 

  allocate(p(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: p" 
  allocate(pp(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: pp" 
  allocate(te(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: te" 
  allocate(ed(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: ed" 
  allocate(t(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: t" 
  allocate(vis(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: vis" 
  allocate(den(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: den" 
  allocate(gen(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: gen" 

  allocate(vart(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: vart" 
  allocate(edd(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: edd" 
  allocate(utt(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: utt" 
  allocate(vtt(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: vtt" 
  allocate(wtt(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: wtt"

  allocate(ret(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: ret" 
  allocate(con(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: con" 

  ! Reynolds stresses
  allocate(uu(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: uu" 
  allocate(uv(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: uv" 
  allocate(uw(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: uw" 
  allocate(vv(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: vv" 
  allocate(vw(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: vw" 
  allocate(ww(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: ww" 

  allocate(yplus(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: yplus" 
  allocate(upl(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: upl" 
  allocate(kplus(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: kplus"  

  if (alphamodel) then
    allocate(alph(nxyz),stat=ierr) 
        if(ierr /= 0)write(*,*)"allocation error: alph" 
    allocate(al_les(nxyz),stat=ierr) 
        if(ierr /= 0)write(*,*)"allocation error: al_les" 
    allocate(al_rans(nxyz),stat=ierr) 
        if(ierr /= 0)write(*,*)"allocation error: al_rans" 
    allocate(diff(nxyz),stat=ierr) 
        if(ierr /= 0)write(*,*)"allocation error: diff" 
  endif

  allocate(strain(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: strain" 
  allocate(Vorticity(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: Vorticity" 

!     durbin time-scale limiter
  if (durbin) then
    allocate(timelimit(nxyz),stat=ierr) 
        if(ierr /= 0)write(*,*)"allocation error: timelimit" 
  endif

!     for menter sst, sas, earsm_wj (wallin-johansson) and earsm_m (menter implementation of wj)
  if (sst.or.sas.or.earsm_wj.or.earsm_m) then 
                    
    allocate(domega(nxyz),stat=ierr) 
        if(ierr /= 0)write(*,*)"allocation error: domega" 
    allocate(alphasst(nxyz),stat=ierr) 
        if(ierr /= 0)write(*,*)"allocation error: alphasst" 
    allocate(bettasst(nxyz),stat=ierr) 
        if(ierr /= 0)write(*,*)"allocation error: bettasst" 
    allocate(prtinv_te(nxyz),stat=ierr) 
        if(ierr /= 0)write(*,*)"allocation error: prtinv_te" 
    allocate(prtinv_ed(nxyz),stat=ierr) 
        if(ierr /= 0)write(*,*)"allocation error: prtinv_ed" 

  if (sas) then
    allocate(qsas(nxyz),stat=ierr) 
        if(ierr /= 0)write(*,*)"allocation error: qsas" 
    allocate(lvk(nxyz),stat=ierr) 
        if(ierr /= 0)write(*,*)"allocation error: lvk"
  endif

  if (earsm_wj.or.earsm_m) then                         
    allocate(cmueff(nxyz),stat=ierr) 
        if(ierr /= 0)write(*,*)"allocation error: cmueff" 
    allocate(bij(5,nxyza),stat=ierr) 
        if(ierr /= 0)write(*,*)"allocation error: bij"  
  endif

  endif



!     coefficient arrays for sip solver
  allocate(bb(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: bb" 
  allocate(bs(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: bs" 
  allocate(bw(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: bw" 
  allocate(bp(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: bp" 
  allocate(bn(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: bn" 
  allocate(be(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: be" 
  allocate(bt(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: bt" 

!!     Coefficient arrays for PISO
  allocate(hb(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: hb" 
  allocate(hs(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: hs" 
  allocate(hw(nxyz),stat=ierr)
      if(ierr /= 0)write(*,*)"allocation error: hw" 
  allocate(hn(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: hn" 
  allocate(he(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: he" 
  allocate(ht(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: ht" 

! Nusselt number
  if (lcal(ien)) then
  ! allocate(bnusmeanw(ny),stat=ierr) 
  !     if(ierr /= 0)write(*,*)"allocation error: bnusmeanw"
  ! allocate(bnusmeane(ny),stat=ierr) 
  !     if(ierr /= 0)write(*,*)"allocation error: bnusmeane"
  ! allocate(bnusmeanb(ny),stat=ierr) 
  !     if(ierr /= 0)write(*,*)"allocation error: bnusmeanb"
  ! allocate(bnusmeant(ny),stat=ierr) 
  !     if(ierr /= 0)write(*,*)"allocation error: bnusmeant"

  ! allocate(bnuslocalw(nyz),stat=ierr) 
  !     if(ierr /= 0)write(*,*)"allocation error: bnuslocalw"
  ! allocate(bnuslocale(nyz),stat=ierr) 
  !     if(ierr /= 0)write(*,*)"allocation error: bnuslocale"

  ! allocate(bnuslocalb(nxy),stat=ierr) 
  !     if(ierr /= 0)write(*,*)"allocation error: bnuslocalb"
  ! allocate(bnuslocalt(nxy),stat=ierr) 
  !     if(ierr /= 0)write(*,*)"allocation error: bnuslocalt"

  ! allocate(bnuselt1(ny*nz),stat=ierr) 
  !     if(ierr /= 0)write(*,*)"allocation error: bnuselt1"
  ! allocate(bnuselt2(ny*nz),stat=ierr) 
  !     if(ierr /= 0)write(*,*)"allocation error: bnuselt2"
  endif


!     Inlet
  allocate(u_inl(nz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: u_inl"
  allocate(v_inl(nz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: v_inl"
  allocate(w_inl(nz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: w_inl"
  allocate(p_inl(nz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: p_inl"
  allocate(t_inl(nz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: t_inl"
  allocate(te_inl(nz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: te_inl"
  allocate(ed_inl(nz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: ed_inl"

!     Wall
  allocate(gentw(nyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: gentw" 
  allocate(gente(nyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: gente" 
  allocate(suedw(nyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: suedw" 
  allocate(suede(nyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: suede" 

  allocate(gents(nxz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: gents" 
  allocate(gentn(nxz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: gentn" 
  allocate(sueds(nxz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: sueds" 
  allocate(suedn(nxz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: suedn" 

  allocate(gentb(nxy),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: gentb" 
  allocate(gentt(nxy),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: gentt" 
  allocate(suedb(nxy),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: suedb" 
  allocate(suedt(nxy),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: suedt" 

!     Time
  allocate(uo(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: uo" 
  allocate(vo(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: vo" 
  allocate(wo(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: wo" 
  allocate(to(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: to" 
  allocate(teo(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: teo" 
  allocate(edo(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: edo" 
  allocate(varto(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: varto" 
  allocate(cono(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: cono" 

  if(bdf) then
  allocate(uoo(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: uoo" 
  allocate(voo(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: voo" 
  allocate(woo(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: woo" 
  allocate(too(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: too" 
  allocate(teoo(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: teoo" 
  allocate(edoo(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: edoo" 
  allocate(vartoo(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: vartoo" 
  allocate(conoo(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: conoo" 
  endif


!     Statistics
  if (ltransient) then

  allocate(u_aver(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: u_aver" 
  allocate(v_aver(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: v_aver" 
  allocate(w_aver(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: w_aver" 
  allocate(te_aver(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: te_aver" 
  allocate(t_aver(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: t_aver" 

  allocate(uu_aver(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: uu_aver" 
  allocate(vv_aver(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: vv_aver" 
  allocate(ww_aver(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: ww_aver" 
  allocate(uv_aver(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: uv_aver" 
  allocate(uw_aver(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: uw_aver" 
  allocate(vw_aver(nxyz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: vw_aver" 

!       allocate(ut_aver(nxyz),stat=ierr) 
!           if(ierr /= 0)write(*,*)"allocation error: ut_aver" 
!       allocate(vt_aver(nxyz),stat=ierr) 
!           if(ierr /= 0)write(*,*)"allocation error: vt_aver" 
!       allocate(wt_aver(nxyz),stat=ierr) 
!           if(ierr /= 0)write(*,*)"allocation error: wt_aver" 
!       allocate(tt_aver(nxyz),stat=ierr) 
!           if(ierr /= 0)write(*,*)"allocation error: tt_aver"

  endif 

!     Logicals for oundary conditions on domain boundary faces
  allocate(lbw(nyza),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: lbw" 
  allocate(lbe(nyza),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: lbe" 
  allocate(lbs(nxza),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: lbs" 
  allocate(lbn(nxza),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: lbn" 
  allocate(lbb(nxya),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: lbb" 
  allocate(lbt(nxya),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: lbt"

  allocate(lbwt(nyza),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: lbwt" 
  allocate(lbet(nyza),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: lbet" 
  allocate(lbst(nxza),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: lbst" 
  allocate(lbnt(nxza),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: lbnt" 
  allocate(lbbt(nxya),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: lbbt" 
  allocate(lbtt(nxya),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: lbtt"

  allocate(lbwc(nyza),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: lbwc" 
  allocate(lbec(nyza),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: lbec" 
  allocate(lbsc(nxza),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: lbsc" 
  allocate(lbnc(nxza),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: lbnc" 
  allocate(lbbc(nxya),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: lbbc" 
  allocate(lbtc(nxya),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: lbtc"

  ! Temperature for adiabatic wall boundary conditions
  allocate(twest(ny,nz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: twest"
  allocate(teast(ny,nz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: teast"
  allocate(tsouth(nx,nz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: tsouth"
  allocate(tnorth(nx,nz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: tnorth"
  allocate(tbottom(nx,ny),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: tbottom"
  allocate(ttop(nx,ny),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: ttop"

  ! Concentration boundary conditions     
  allocate(conwest(ny,nz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: conwest"
  allocate(coneast(ny,nz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: coneast"
  allocate(consouth(nx,nz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: consouth"
  allocate(connorth(nx,nz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: connorth"
  allocate(conbottom(nx,ny),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: conbottom"
  allocate(contop(nx,ny),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: contop"

  ! Heat fluxes for non-adiabatic B.C.
  allocate(qflxwest(ny,nz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: qflxwest"
  allocate(qflxeast(ny,nz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: qflxeast"
  allocate(qflxsouth(nx,nz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: qflxsouth"
  allocate(qflxnorth(nx,nz),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: qflxnorth"
  allocate(qflxbottom(nx,ny),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: qflxbottom"
  allocate(qflxtop(nx,ny),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: qflxtop"


!     Gradient
  allocate(gradu(3,nxyza),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: gradu"
  allocate(gradv(3,nxyza),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: gradv"
  allocate(gradw(3,nxyza),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: gradw"
  allocate(gradte(3,nxyza),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: gradte"
  allocate(graded(3,nxyza),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: graded"
  allocate(gradp(3,nxyza),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: gradp"
  !allocate(gradt(3,nxyza),stat=ierr) 
    !if(ierr /= 0)write(*,*)"allocation error: gradt"
  !allocate(gradvart(3,nxyza),stat=ierr) 
    !if(ierr /= 0)write(*,*)"allocation error: gradvart"
  !allocate(gradcon(3,nxyza),stat=ierr) 
    !if(ierr /= 0)write(*,*)"allocation error: gradcon"
!.....variant 1:
  ! allocate(d(6,nxyza),stat=ierr) 
!.....variant 2 - the new qr procedure:
  allocate(dqr(3,6,nxyza),stat=ierr) 
      if(ierr /= 0)write(*,*)"allocation error: d"

  return
  end


      SUBROUTINE DEALLOCATE_ARRAYS
!
!     DEALLOCATE ARRAYS
!
      USE PARAMETERS
      USE GEOMETRY
      USE INDEXES
      USE VARIABLES
      USE COEF
      USE COEFB
      USE HCOEF
      USE BC
      USE TIME_MOD
      USE TITLE_MOD
      USE STATISTICS
      USE NUSSELT
      USE WALL
      USE INLET
      USE GRADIENTS
      USE OMEGA_Turb_Models
!
      IMPLICIT NONE

!     GEOMETRY RELATED
      if (allocated(X)) deallocate(X)
      if (allocated(Y)) deallocate(Y)
      if (allocated(Z)) deallocate(Z)
      if (allocated(FX)) deallocate(FX)
      if (allocated(FY)) deallocate(FY)
      if (allocated(FZ)) deallocate(FZ)
      if (allocated(XC)) deallocate(XC)
      if (allocated(YC)) deallocate(YC)
      if (allocated(ZC)) deallocate(ZC)
      if (allocated(VOL)) deallocate(VOL)
      if (allocated(AR1X)) deallocate(AR1X)
      if (allocated(AR1Y)) deallocate(AR1Y)
      if (allocated(AR1Z)) deallocate(AR1Z)
      if (allocated(AR2X)) deallocate(AR2X)
      if (allocated(AR2Y)) deallocate(AR2Y)
      if (allocated(AR2Z)) deallocate(AR2Z)
      if (allocated(AR3X)) deallocate(AR3X)
      if (allocated(AR3Y)) deallocate(AR3Y)
      if (allocated(AR3Y)) deallocate(AR3Z)
      if (allocated(wallDistance)) deallocate(wallDistance)

      if (allocated(LI)) deallocate(LI) 
      if (allocated(LK)) deallocate(LK) 

!     COEFFICIENT ARRAYS
      if (allocated(AE)) deallocate(AE)
      if (allocated(AW)) deallocate(AW)
      if (allocated(AN)) deallocate(AN)
      if (allocated(AS)) deallocate(AS)
      if (allocated(AT)) deallocate(AT)
      if (allocated(AB)) deallocate(AB)
      if (allocated(AP)) deallocate(AP)
      if (allocated(SU)) deallocate(SU)
      if (allocated(SV)) deallocate(SV)
      if (allocated(SW)) deallocate(SW)
      if (allocated(SP)) deallocate(SP)
      if (allocated(RES)) deallocate(RES)
      if (allocated(SPV)) deallocate(SPV)
      if (allocated(APU)) deallocate(APU)

!     VARIABLES
      if (allocated(U)) deallocate(U)
      if (allocated(V)) deallocate(V)
      if (allocated(W)) deallocate(W)
      if (allocated(F1)) deallocate(F1)
      if (allocated(F2)) deallocate(F2)
      if (allocated(F3)) deallocate(F3)
      if (allocated(P)) deallocate(P)
      if (allocated(PP)) deallocate(PP)
      if (allocated(TE)) deallocate(TE)
      if (allocated(ED)) deallocate(ED)
      if (allocated(T)) deallocate(T)
      if (allocated(VIS)) deallocate(VIS)
      if (allocated(DEN)) deallocate(DEN)
      if (allocated(GEN)) deallocate(GEN)
      if (allocated(VART)) deallocate(VART)
      if (allocated(EDD)) deallocate(EDD)
      if (allocated(UTT)) deallocate(UTT)
      if (allocated(VTT)) deallocate(VTT)
      if (allocated(WTT)) deallocate(WTT)
      if (allocated(RET)) deallocate(RET)
      if (allocated(CON)) deallocate(CON)
      if (allocated(UU)) deallocate(UU)
      if (allocated(UV)) deallocate(UV)
      if (allocated(UW)) deallocate(UW)
      if (allocated(VV)) deallocate(VV)
      if (allocated(VW)) deallocate(VW)
      if (allocated(WW)) deallocate(WW)
      if (allocated(YPLUS)) deallocate(YPLUS)
      if (allocated(UPL)) deallocate(UPL)
      if (allocated(KPLUS)) deallocate(KPLUS)

      !IF (ALPHAMODEL) THEN
      if (allocated(ALPH)) deallocate(ALPH)
      if (allocated(AL_LES)) deallocate(AL_LES)
      if (allocated(AL_RANS)) deallocate(AL_RANS)
      if (allocated(DIFF)) deallocate(DIFF)
      !ENDIF

      if (allocated(STRAIN)) deallocate(STRAIN)
      if (allocated(Vorticity)) deallocate(Vorticity)

      !IF (DURBIN) THEN
      if (allocated(TIMELIMIT)) deallocate(TIMELIMIT)
      !ENDIF

      !IF (SST.OR.SAS) THEN    
                    
      if (allocated(DOMEGA)) deallocate(DOMEGA) 
      if (allocated(ALPHASST)) deallocate(ALPHASST)
      if (allocated(BETTASST)) deallocate(BETTASST)
      if (allocated(PRTINV_TE)) deallocate(PRTINV_TE) 
      if (allocated(PRTINV_ED)) deallocate(PRTINV_ED) 

      !IF (SAS) THEN  
      if (allocated(QSAS)) deallocate(QSAS)
      if (allocated(LVK)) deallocate(LVK) 
      !ENDIF

      !IF (EARSM_WJ.OR.EARSM_M) THEN                         
      if (allocated(CMUEFF)) deallocate(CMUEFF) 
      if (allocated(BIJ)) deallocate(BIJ) 
      !ENDIF

      !ENDIF


!     COEFFICIENT ARRAYS FOR SIP SOLVER
      if (allocated(BB)) deallocate(BB)
      if (allocated(BS)) deallocate(BS)
      if (allocated(BW)) deallocate(BW)
      if (allocated(BP)) deallocate(BP)
      if (allocated(BN)) deallocate(BN)
      if (allocated(BE)) deallocate(BE)
      if (allocated(BT)) deallocate(BT)

!     COEFFICIENT ARRAYS FOR PISO
      if (allocated(HB)) deallocate(HB)
      if (allocated(HS)) deallocate(HS)
      if (allocated(HW)) deallocate(HW)
      if (allocated(HN)) deallocate(HN)
      if (allocated(HE)) deallocate(HE)
      if (allocated(HT)) deallocate(HT)

!     NUSSELT NO.
      if (allocated(BNUSMEANW)) deallocate(BNUSMEANW)
      if (allocated(BNUSMEANE)) deallocate(BNUSMEANE)
      if (allocated(BNUSMEANB)) deallocate(BNUSMEANB)
      if (allocated(BNUSMEANT)) deallocate(BNUSMEANT)
      if (allocated(BNUSLOCALE)) deallocate(BNUSLOCALE)
      if (allocated(BNUSLOCALW)) deallocate(BNUSLOCALW)
      if (allocated(BNUSLOCALB)) deallocate(BNUSLOCALB)
      if (allocated(BNUSLOCALT)) deallocate(BNUSLOCALT)
      if (allocated(BNUSELT1)) deallocate(BNUSELT1)
      if (allocated(BNUSELT2)) deallocate(BNUSELT2)

!     INLET
      if (allocated(U_INL)) deallocate(U_INL)
      if (allocated(V_INL)) deallocate(V_INL)
      if (allocated(W_INL)) deallocate(W_INL)
      if (allocated(P_INL)) deallocate(P_INL)
      if (allocated(T_INL)) deallocate(T_INL)
      if (allocated(TE_INL)) deallocate(TE_INL)
      if (allocated(ED_INL)) deallocate(ED_INL)

!     WALL
      if (allocated(GENTW)) deallocate(GENTW)
      if (allocated(GENTE)) deallocate(GENTE)
      if (allocated(SUEDW)) deallocate(SUEDW)
      if (allocated(SUEDE)) deallocate(SUEDE)
      if (allocated(GENTS)) deallocate(GENTS)
      if (allocated(GENTN)) deallocate(GENTN)
      if (allocated(SUEDS)) deallocate(SUEDS)
      if (allocated(SUEDN)) deallocate(SUEDN)
      if (allocated(GENTB)) deallocate(GENTB)
      if (allocated(GENTT)) deallocate(GENTT)
      if (allocated(SUEDB)) deallocate(SUEDB)
      if (allocated(SUEDT)) deallocate(SUEDT)

!     TIME
      if (allocated(UO)) deallocate(UO)
      if (allocated(VO)) deallocate(VO)
      if (allocated(WO)) deallocate(WO)
      if (allocated(TO)) deallocate(TO)
      if (allocated(TEO)) deallocate(TEO)
      if (allocated(EDO)) deallocate(EDO)
      if (allocated(VARTO)) deallocate(VARTO)
      if (allocated(CONO)) deallocate(CONO)

      !IF (BDF) THEN
      if (allocated(UOO)) deallocate(UOO)
      if (allocated(VOO)) deallocate(VOO)
      if (allocated(WOO)) deallocate(WOO)
      if (allocated(TOO)) deallocate(TOO)
      if (allocated(TEOO)) deallocate(TEOO)
      if (allocated(EDOO)) deallocate(EDOO)
      if (allocated(VARTOO)) deallocate(VARTOO)
      if (allocated(CONOO)) deallocate(CONOO)
      !ENDIF


!     STATISTICS
      !IF (LTRANSIENT) THEN 
      if (allocated(U_AVER)) deallocate(U_AVER)
      if (allocated(V_AVER)) deallocate(V_AVER)
      if (allocated(W_AVER)) deallocate(W_AVER)
      if (allocated(TE_AVER)) deallocate(TE_AVER)
      if (allocated(T_AVER)) deallocate(T_AVER)
      if (allocated(UU_AVER)) deallocate(UU_AVER)
      if (allocated(VV_AVER)) deallocate(VV_AVER)
      if (allocated(WW_AVER)) deallocate(WW_AVER)
      if (allocated(UV_AVER)) deallocate(UV_AVER)
      if (allocated(UW_AVER)) deallocate(UW_AVER)
      if (allocated(VW_AVER)) deallocate(VW_AVER)
!      if (allocated(UT_AVER)) deallocate(UT_AVER)
!      if (allocated(VT_AVER)) deallocate(VT_AVER)
!      if (allocated(WT_AVER)) deallocate(WT_AVER)
!      if (allocated(TT_AVER)) deallocate(TT_AVER)
      !ENDIF

!     BOUNDARY CONDITION
      if (allocated(LBW)) deallocate(LBW)
      if (allocated(LBE)) deallocate(LBE)
      if (allocated(LBS)) deallocate(LBS)
      if (allocated(LBN)) deallocate(LBN)
      if (allocated(LBT)) deallocate(LBT)
      if (allocated(LBB)) deallocate(LBB)

      if (allocated(LBWT)) deallocate(LBWT)
      if (allocated(LBET)) deallocate(LBET)
      if (allocated(LBST)) deallocate(LBST)
      if (allocated(LBNT)) deallocate(LBNT)
      if (allocated(LBTT)) deallocate(LBTT)
      if (allocated(LBBT)) deallocate(LBBT)

      if (allocated(LBWC)) deallocate(LBWC)
      if (allocated(LBEC)) deallocate(LBEC)
      if (allocated(LBSC)) deallocate(LBSC)
      if (allocated(LBNC)) deallocate(LBNC)
      if (allocated(LBTC)) deallocate(LBTC)
      if (allocated(LBBC)) deallocate(LBBC)

      if (allocated(TWEST)) deallocate(TWEST)
      if (allocated(TEAST)) deallocate(TEAST)
      if (allocated(TSOUTH)) deallocate(TSOUTH)
      if (allocated(TNORTH)) deallocate(TNORTH)
      if (allocated(TTOP)) deallocate(TTOP)
      if (allocated(TBOTTOM)) deallocate(TBOTTOM)

      if (allocated(QFLXWEST)) deallocate(QFLXWEST)
      if (allocated(QFLXEAST)) deallocate(QFLXEAST)
      if (allocated(QFLXSOUTH)) deallocate(QFLXSOUTH)
      if (allocated(QFLXNORTH)) deallocate(QFLXNORTH)
      if (allocated(QFLXTOP)) deallocate(QFLXTOP)
      if (allocated(QFLXBOTTOM)) deallocate(QFLXBOTTOM)

      if (allocated(CONWEST)) deallocate(CONWEST)
      if (allocated(CONEAST)) deallocate(CONEAST)
      if (allocated(CONSOUTH)) deallocate(CONSOUTH)
      if (allocated(CONNORTH)) deallocate(CONNORTH)
      if (allocated(CONTOP)) deallocate(CONTOP)
      if (allocated(CONBOTTOM)) deallocate(CONBOTTOM)

!     GRADIENT
      if (allocated(gradu)) deallocate(gradu)
      if (allocated(gradv)) deallocate(gradv)
      if (allocated(gradw)) deallocate(gradw)
      if (allocated(gradTE)) deallocate(gradTE)
      if (allocated(gradED)) deallocate(gradED)
      if (allocated(gradP)) deallocate(gradP) 
      if (allocated(gradT)) deallocate(gradT) 
      if (allocated(gradVART)) deallocate(gradVART) 
      if (allocated(gradCON)) deallocate(gradCON) 
      if (allocated(D)) deallocate(D)

      RETURN
      END
