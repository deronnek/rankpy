# This file is part of RankPy.
#
# RankPy is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# RankPy is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with RankPy. If not, see <http://www.gnu.org/licenses/>.


from cython cimport view

from ._utils cimport DOUBLE_t
from ._utils cimport INT_t


# =============================================================================
# Metric
# =============================================================================


cdef class Metric:
    #
    # The interface for an information retrieval evaluation metric.
    #

    # Fields
    cdef public INT_t cutoff # The metric cutoff threshold.

    # Python methods
    cpdef evaluate_ranking(self, INT_t[::1] document_ranks, INT_t[::1] relevance_scores, DOUBLE_t scale_value)
    cpdef evaluate(self, INT_t[::1] ranked_relevance_scores, DOUBLE_t scale_value)
    cpdef evaluate_queries(self, INT_t[::1] query_indptr, INT_t[::1] relevance_scores, DOUBLE_t[::1] ranking_scores, DOUBLE_t[::1] scale_values, DOUBLE_t[::1] out)
    cpdef evaluate_queries_ideal(self, INT_t[::1] query_indptr, INT_t[::1] relevance_scores, DOUBLE_t[::1] ideal_values)
    cpdef delta(self, INT_t i, INT_t offset, INT_t[::1] document_ranks, INT_t[::1] relevance_scores, DOUBLE_t scale_value, DOUBLE_t[::1] out)

    # C methods
    cdef void delta_c(self, INT_t i, INT_t offset, INT_t n_documents, INT_t *document_ranks, INT_t *relevance_scores, DOUBLE_t scale_value, DOUBLE_t *out) nogil