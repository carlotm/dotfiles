/*
 *  alpm-query.h
 *
 *  Copyright (c) 2010 Tuxce <tuxce.net@gmail.com>
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
#ifndef PQ_ALPM_QUERY_H
#define PQ_ALPM_QUERY_H
#include <stdbool.h>
#include <alpm.h>
#include <alpm_list.h>


/*
 * Filter
 */
#define F_FOREIGN      (1 << 0) /* 1 */
#define F_EXPLICIT     (1 << 1) /* 2 */
#define F_DEPS         (1 << 2) /* 4 */
#define F_UNREQUIRED   (1 << 3) /* 8 */
#define F_UPGRADES     (1 << 4) /* 16 */
#define F_GROUP        (1 << 5) /* 32 */
#define F_NATIVE       (1 << 6) /* 64 */
#define F_UNREQUIRED_2 (1 << 7) /* 128 */


/*
 * Parse pacman config to find sync databases
 */
/* get_db_sync() returns new list, use FREELIST() to free the list */
alpm_list_t *get_db_sync (void);
/* init_db_sync() registers sync database */
bool init_db_sync (void);

/*
 * ALPM search functions
 * Returns number of packages found
 * Those functions call print_package()
 */
unsigned int search_pkg_by_type (alpm_db_t *db, alpm_list_t **targets);
unsigned int search_pkg_by_name (alpm_db_t *db, alpm_list_t **targets);
unsigned int list_grp (alpm_db_t *db, alpm_list_t *targets);
unsigned int search_pkg (alpm_db_t *db, alpm_list_t *targets);
unsigned int list_db (alpm_db_t *db, alpm_list_t *targets);
unsigned int alpm_search_local (unsigned short filter, const char *format,
                                alpm_list_t **res);

off_t get_size_pkg (alpm_pkg_t *pkg);

/*
 * alpm_pkg_get_str() get info for package
 * alpm_local_pkg_get_str() get info for local package
 * alpm_grp_get_str() get info for group
 * str returned should not be passed to free
 */
const char *alpm_pkg_get_str (const void *p, unsigned char c);
const char *alpm_local_pkg_get_str (const char *pkg_name, unsigned char c);
const char *alpm_grp_get_str (const void *p, unsigned char c);

void alpm_cleanup (void);

#endif

/* vim: set ts=4 sw=4 noet: */
