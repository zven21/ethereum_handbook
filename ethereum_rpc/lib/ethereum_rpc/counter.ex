defmodule EthereumRPC.Counter do
  @moduledoc """
  An application wide RPC2Ethereum client request counter.
  """
  @table :rpc_requests_counter

  @spec setup() :: :ok
  def setup() do
    @table =
      :ets.new(@table, [
        :set,
        :named_table,
        :public,
        write_concurrency: true
      ])

    :ok
  end

  # @spec get(atom()) :: integer()
  def get(key) do
    case :ets.lookup(@table, key) do
      [] -> 1
      [{^key, num}] -> num
    end
  end

  def increment(key) do
    :ets.update_counter(@table, key, {2, 1}, {key, 0})
  end

  def increment(key, count) do
    :ets.update_counter(@table, key, {2, count}, {key, 0})
  end
end
