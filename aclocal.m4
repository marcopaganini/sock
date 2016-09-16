dnl aclocal.m4 generated automatically by aclocal 1.4

dnl Copyright (C) 1994, 1995-8, 1999 Free Software Foundation, Inc.
dnl This file is free software; the Free Software Foundation
dnl gives unlimited permission to copy and/or distribute it,
dnl with or without modifications, as long as this notice is preserved.

dnl This program is distributed in the hope that it will be useful,
dnl but WITHOUT ANY WARRANTY, to the extent permitted by law; without
dnl even the implied warranty of MERCHANTABILITY or FITNESS FOR A
dnl PARTICULAR PURPOSE.

dnl ##################################################################
dnl AC_CHECK_FUNC_PROTO(func_prototype, header)
dnl Our macro to check for a function prototype in a given header.
dnl
AC_DEFUN(AC_CHECK_FUNC_PROTO,
	[AC_CACHE_CHECK(for $1 function prototype in $2, ac_cv_have_$1_proto,
		AC_EGREP_HEADER($1, $2,
			ac_cv_have_$1_proto=yes,
			ac_cv_have_$1_proto=no))
	if test $ac_cv_have_$1_proto = yes ; then
    		ac_tr_func=HAVE_`echo $1 | tr 'abcdefghijklmnopqrstuvwxyz' 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'`_PROTO
		AC_DEFINE_UNQUOTED($ac_tr_func)
	fi
])

dnl ##################################################################
dnl We cannot use the AC_CHECK_TYPE macros because AC_CHECK_TYPE
dnl #includes only <sys/types.h>, <stdlib.h>, and <stddef.h>.
dnl Unfortunately, many implementations today hide typedefs in wierd
dnl locations: Solaris 2.5.1 has uint8_t and uint32_t in <pthread.h>.
dnl SunOS 4.1.x has int8_t in <sys/bitypes.h>.
dnl So we define our own macro AC_UNP_CHECK_TYPE that does the same
dnl #includes as "unp.h", and then looks for the typedef.
dnl
dnl This macro should be invoked after all the header checks have been
dnl performed, since we #include "confdefs.h" below, and then use the
dnl HAVE_foo_H values that it can #define.
dnl
AC_DEFUN(AC_UNP_CHECK_TYPE,
	[AC_MSG_CHECKING(if $1 defined)
	AC_CACHE_VAL(ac_cv_type_$1,
		AC_TRY_COMPILE(
[
#include        "confdefs.h"    /* the header built by configure so far */
#ifdef  HAVE_SYS_TYPES_H
#  include      <sys/types.h>
#endif
#ifdef  HAVE_SYS_SOCKET_H
#  include      <sys/socket.h>
#endif
#ifdef  HAVE_SYS_TIME_H
#  include    <sys/time.h>
#endif
#ifdef  HAVE_NETINET_IN_H
#  include    <netinet/in.h>
#endif
#ifdef  HAVE_ARPA_INET_H
#  include    <arpa/inet.h>
#endif
#ifdef  HAVE_ERRNO_H
#  include    <errno.h>
#endif
#ifdef  HAVE_FCNTL_H
#  include    <fcntl.h>
#endif
#ifdef  HAVE_NETDB_H
#  include      <netdb.h>
#endif
#ifdef  HAVE_SIGNAL_H
#  include      <signal.h>
#endif
#ifdef  HAVE_STDIO_H
#  include      <stdio.h>
#endif
#ifdef  HAVE_STDLIB_H
#  include      <stdlib.h>
#endif
#ifdef  HAVE_STRING_H
#  include      <string.h>
#endif
#ifdef  HAVE_SYS_STAT_H
#  include      <sys/stat.h>
#endif
#ifdef  HAVE_SYS_UIO_H
#  include      <sys/uio.h>
#endif
#ifdef  HAVE_UNISTD_H
#  include      <unistd.h>
#endif
#ifdef  HAVE_SYS_WAIT_H
#  include      <sys/wait.h>
#endif
#ifdef  HAVE_SYS_UN_H
#  include      <sys/un.h>
#endif
#ifdef  HAVE_SYS_SELECT_H
# include   <sys/select.h>
#endif
#ifdef  HAVE_STRINGS_H
# include   <strings.h>
#endif
#ifdef  HAVE_SYS_IOCTL_H
# include   <sys/ioctl.h>
#endif
#ifdef  HAVE_SYS_FILIO_H
# include   <sys/filio.h>
#endif
#ifdef  HAVE_SYS_SOCKIO_H
# include   <sys/sockio.h>
#endif
#ifdef  HAVE_PTHREAD_H
#  include      <pthread.h>
#endif],
                [ $1 foo ],
                ac_cv_type_$1=yes,
                ac_cv_type_$1=no))
        AC_MSG_RESULT($ac_cv_type_$1)
        if test $ac_cv_type_$1 = no ; then
                AC_DEFINE($1, $2)
        fi
])


# Do all the work for Automake.  This macro actually does too much --
# some checks are only needed if your package does certain things.
# But this isn't really a big deal.

# serial 1

dnl Usage:
dnl AM_INIT_AUTOMAKE(package,version, [no-define])

AC_DEFUN(AM_INIT_AUTOMAKE,
[AC_REQUIRE([AC_PROG_INSTALL])
PACKAGE=[$1]
AC_SUBST(PACKAGE)
VERSION=[$2]
AC_SUBST(VERSION)
dnl test to see if srcdir already configured
if test "`cd $srcdir && pwd`" != "`pwd`" && test -f $srcdir/config.status; then
  AC_MSG_ERROR([source directory already configured; run "make distclean" there first])
fi
ifelse([$3],,
AC_DEFINE_UNQUOTED(PACKAGE, "$PACKAGE", [Name of package])
AC_DEFINE_UNQUOTED(VERSION, "$VERSION", [Version number of package]))
AC_REQUIRE([AM_SANITY_CHECK])
AC_REQUIRE([AC_ARG_PROGRAM])
dnl FIXME This is truly gross.
missing_dir=`cd $ac_aux_dir && pwd`
AM_MISSING_PROG(ACLOCAL, aclocal, $missing_dir)
AM_MISSING_PROG(AUTOCONF, autoconf, $missing_dir)
AM_MISSING_PROG(AUTOMAKE, automake, $missing_dir)
AM_MISSING_PROG(AUTOHEADER, autoheader, $missing_dir)
AM_MISSING_PROG(MAKEINFO, makeinfo, $missing_dir)
AC_REQUIRE([AC_PROG_MAKE_SET])])

#
# Check to make sure that the build environment is sane.
#

AC_DEFUN(AM_SANITY_CHECK,
[AC_MSG_CHECKING([whether build environment is sane])
# Just in case
sleep 1
echo timestamp > conftestfile
# Do `set' in a subshell so we don't clobber the current shell's
# arguments.  Must try -L first in case configure is actually a
# symlink; some systems play weird games with the mod time of symlinks
# (eg FreeBSD returns the mod time of the symlink's containing
# directory).
if (
   set X `ls -Lt $srcdir/configure conftestfile 2> /dev/null`
   if test "[$]*" = "X"; then
      # -L didn't work.
      set X `ls -t $srcdir/configure conftestfile`
   fi
   if test "[$]*" != "X $srcdir/configure conftestfile" \
      && test "[$]*" != "X conftestfile $srcdir/configure"; then

      # If neither matched, then we have a broken ls.  This can happen
      # if, for instance, CONFIG_SHELL is bash and it inherits a
      # broken ls alias from the environment.  This has actually
      # happened.  Such a system could not be considered "sane".
      AC_MSG_ERROR([ls -t appears to fail.  Make sure there is not a broken
alias in your environment])
   fi

   test "[$]2" = conftestfile
   )
then
   # Ok.
   :
else
   AC_MSG_ERROR([newly created file is older than distributed files!
Check your system clock])
fi
rm -f conftest*
AC_MSG_RESULT(yes)])

dnl AM_MISSING_PROG(NAME, PROGRAM, DIRECTORY)
dnl The program must properly implement --version.
AC_DEFUN(AM_MISSING_PROG,
[AC_MSG_CHECKING(for working $2)
# Run test in a subshell; some versions of sh will print an error if
# an executable is not found, even if stderr is redirected.
# Redirect stdin to placate older versions of autoconf.  Sigh.
if ($2 --version) < /dev/null > /dev/null 2>&1; then
   $1=$2
   AC_MSG_RESULT(found)
else
   $1="$3/missing $2"
   AC_MSG_RESULT(missing)
fi
AC_SUBST($1)])

# Like AC_CONFIG_HEADER, but automatically create stamp file.

AC_DEFUN(AM_CONFIG_HEADER,
[AC_PREREQ([2.12])
AC_CONFIG_HEADER([$1])
dnl When config.status generates a header, we must update the stamp-h file.
dnl This file resides in the same directory as the config header
dnl that is generated.  We must strip everything past the first ":",
dnl and everything past the last "/".
AC_OUTPUT_COMMANDS(changequote(<<,>>)dnl
ifelse(patsubst(<<$1>>, <<[^ ]>>, <<>>), <<>>,
<<test -z "<<$>>CONFIG_HEADERS" || echo timestamp > patsubst(<<$1>>, <<^\([^:]*/\)?.*>>, <<\1>>)stamp-h<<>>dnl>>,
<<am_indx=1
for am_file in <<$1>>; do
  case " <<$>>CONFIG_HEADERS " in
  *" <<$>>am_file "*<<)>>
    echo timestamp > `echo <<$>>am_file | sed -e 's%:.*%%' -e 's%[^/]*$%%'`stamp-h$am_indx
    ;;
  esac
  am_indx=`expr "<<$>>am_indx" + 1`
done<<>>dnl>>)
changequote([,]))])

