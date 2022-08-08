ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

ROOT_E = ${ROOT_DIR}/e-wip
ROOT_U = ${ROOT_DIR}/u-wip
SPLIT = tools/splat/split.py


.PHONY: e
e:
	rm -Rf "${ROOT_E}/*"
	cookiecutter --overwrite-if-exists --no-input template region=e
	${SPLIT} --basedir "${ROOT_E}" "${ROOT_E}/legoracers.yaml"
	make --directory="${ROOT_E}" clean
	make --directory="${ROOT_E}" rom.z64

.PHONY: u
u:
	rm -Rf "${ROOT_U}/*"
	cookiecutter --overwrite-if-exists --no-input template region=u
	${SPLIT} --basedir "${ROOT_U}" "${ROOT_U}/legoracers.yaml"
	make --directory="${ROOT_U}" clean
	make --directory="${ROOT_U}" rom.z64
	

split: e u
