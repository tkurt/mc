/*
   Declarations for list of mounted filesystems
 */

/** \file mountlist.h
 *  \brief Header: list of mounted filesystems
 */

#ifndef MC__MOUNTLIST_H
#define MC__MOUNTLIST_H

#include <stdint.h>             /* uintmax_t */

/*** typedefs(not structures) and defined constants **********************************************/

/*** enums ***************************************************************************************/

/*** structures declarations (and typedefs of structures)*****************************************/

/* Filesystem status */
struct my_statfs
{
    int type;
    char *typename;
    const char *mpoint;
    const char *mroot;
    const char *device;
    uintmax_t avail;            /* in kB */
    uintmax_t total;            /* in kB */
    uintmax_t nfree;
    uintmax_t nodes;
};

/* A mount table entry. */
struct mount_entry
{
    char *me_devname;           /* Device node name, including "/dev/". */
    char *me_mountdir;          /* Mount point directory name. */
    char *me_mntroot;           /* Directory on filesystem of device used
                                   as root for the (bind) mount. */
    char *me_type;              /* "nfs", "4.2", etc. */
    dev_t me_dev;               /* Device number of me_mountdir. */
    unsigned int me_dummy:1;    /* Nonzero for dummy file systems. */
    unsigned int me_remote:1;   /* Nonzero for remote fileystems. */
    unsigned int me_type_malloced:1;    /* Nonzero if me_type was malloced. */
};

struct fs_usage
{
    uintmax_t fsu_blocksize;    /* Size of a block.  */
    uintmax_t fsu_blocks;       /* Total blocks. */
    uintmax_t fsu_bfree;        /* Free blocks available to superuser. */
    uintmax_t fsu_bavail;       /* Free blocks available to non-superuser. */
    int fsu_bavail_top_bit_set; /* 1 if fsu_bavail represents a value < 0.  */
    uintmax_t fsu_files;        /* Total file nodes. */
    uintmax_t fsu_ffree;        /* Free file nodes. */
};

/*** global variables defined in .c file *********************************************************/

/*** declarations of public functions ************************************************************/

void init_my_statfs (void);
void my_statfs (struct my_statfs *myfs_stats, const char *path);
void free_my_statfs (void);

#ifdef HAVE_INFOMOUNT
int get_fs_usage (char const *file, char const *disk, struct fs_usage *fsp);
#endif        /* HAVE_INFOMOUNT */

GSList *
read_file_system_list (void);

/*** inline functions ****************************************************************************/

#endif /* MC__MOUNTLIST_H */
