{ ... }: {
  boot.kernel.sysctl = {
    "vm.overcommit_memory" = 1;
    # Reduce memory fragmentation from many small allocations
    "vm.compact_memory" = 1; # Trigger compaction on demand
  };
  systemd.tmpfiles.rules = [
    # THP Shrinker has been added in the 6.12 Kernel
    # Default Value is 511
    # THP=always policy vastly overprovisions THPs in sparsely accessed memory areas, resulting in excessive memory pressure and premature OOM killing
    # 409 means that any THP that has more than 409 out of 512 (80%) zero filled filled pages will be split.
    # This reduces the memory usage, when THP=always used and the memory usage goes down to around the same usage as when madvise is used, while still providing an equal performance improvement
    "w! /sys/kernel/mm/transparent_hugepage/khugepaged/max_ptes_none - - - - 409"

    # Improve performance for applications that use tcmalloc
    # https://github.com/google/tcmalloc/blob/master/docs/tuning.md#system-level-optimizations
    "w! /sys/kernel/mm/transparent_hugepage/defrag - - - - defer+madvise"

    "w! /sys/kernel/mm/transparent_hugepage/enabled - - - - madvise"
  ];
}
