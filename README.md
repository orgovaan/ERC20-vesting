/*egy tok egyszeru ERC20 token vesting contract:
tokent bele lehet tenni es havonta x% szabadul fel - azaz meginkabb: x honap alatt egyenletesen szabadul fel

igazabol ket felallast is el tudok kepzelni:
1) vestingbol x/ho szabadul ki es azt a deploymentkor megadott multisig cimere kikuldi egy fuggvenyhivas
a multisig egy standard multisig (valamelyik ismert elfogadott multisig), amihez tobb cimet hozza lehet adni, valtoztathato a threshold es a multisig alairok tetsozleges modon kiutalhatjak a vimukon levo cuccot
2) a vestingnek az ownere egy multisig es annak a kiclaimelesehez kell multisig alairni - sztem itt egy custom multisiget kell akkor viszont hasznalni es nem lehet valamelyik standard multisiget 

ezek sajat tokenunk kulonbozo celra a publikum elott vestingelt cimei lesznek
marketing budget - e. vesting
xy - 2. vesting
es nem szeretnenk ha elveszne az egesz ha elveszik 1 privatkulcs
ezert multisig elsosorban