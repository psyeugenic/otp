/*
 * %CopyrightBegin%
 *
 * Copyright Ericsson AB 1996-2014. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * %CopyrightEnd%
 */

#ifdef USE_LTTNG
#undef TRACEPOINT_PROVIDER
#define TRACEPOINT_PROVIDER com_ericsson_otp

#undef TRACEPOINT_INCLUDE
#define TRACEPOINT_INCLUDE "erlang_lttng.h"

#if !defined(__ERLANG_LTTNG_H__) || defined(TRACEPOINT_HEADER_MULTI_READ)
#define __ERLANG_LTTNG_H__

#include <lttng/tracepoint.h>


#endif /* __ERLANG_LTTNG_H__ */
#include <lttng/tracepoint-event.h>
#endif /* USE_LTTNG */
