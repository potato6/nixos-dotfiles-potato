{ ... }:
{
  environment = {
    memoryAllocator.provider = "jemalloc";
    variables.MALLOC_CONF = "metadata_thp:auto,tcache:true";
  };
}
