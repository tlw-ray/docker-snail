"""
Example DAG demonstrating a workflow with nested branching. The join tasks are created with
``none_failed_or_skipped`` trigger rule such that they are skipped whenever their corresponding
``BranchPythonOperator`` are skipped.
"""

from airflow.models import DAG
from airflow.operators.dummy_operator import DummyOperator
from airflow.operators.bash_operator import BashOperator
from airflow.utils.dates import days_ago

with DAG(dag_id="join_dag2", start_date=days_ago(2), schedule_interval="@daily") as dag:
    d1 = DummyOperator(task_id="d1")
    d2 = DummyOperator(task_id="d2")
    d3 = DummyOperator(task_id="d3")
    d4 = DummyOperator(task_id="d4")
    j1 = DummyOperator(task_id="j1")
    j2 = DummyOperator(task_id="j2", trigger_rule="one_success")
    f1 = BashOperator(task_id="f1", bash_command="aaaa")
    t1 = BashOperator(task_id="t1", bash_command="date")
    [d1, d2, t1] >> j1 >> [d3, d4, f1] >> j2
