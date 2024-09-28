PYTHON="python"
COMPILER="teenytiny.py"
CC="gcc"
BDIR="build"

function comp {
	BN=$(basename -s .teeny $1)
	TTOUTPUT=$(${PYTHON} ${COMPILER} $1 2>&1)
	if [ $? -ne 0 ]; then
		echo "${TTOUTPUT}"
	else
		mv out.c ${BN}.c
		CCOUTPUT=$(${CC} -o ${BDIR}/${BN} ${BN}.c)
		if [ $? -ne 0 ]; then
			echo "${CCOUTPUT}"
		fi
	fi
}


if [ $# -eq 0 ]; then
	>&2 echo "Usage: <examples|clean>"
	exit 1
fi

case $1 in
	"examples")
		rm -rf $BDIR 2>/dev/null
		rm *.c 2>/dev/null
		mkdir $BDIR

		for i in $(ls examples/*.teeny); do
			comp $i
		done
		;;

	"clean")
		rm -rf $BDIR 2>/dev/null
		rm *.c 2>/dev/null
		;;

	*)
		>&2 echo "Usage: <examples|clean>"
		exit 1
		;;
esac
