"""
Example DAG demonstrating a workflow with nested branching. The join tasks are created with
``none_failed_or_skipped`` trigger rule such that they are skipped whenever their corresponding
``BranchPythonOperator`` are skipped.
"""

from airflow.models import DAG
from airflow.operators.dummy_operator import DummyOperator
from airflow.operators.python_operator import BranchPythonOperator
from airflow.utils.dates import days_ago

with DAG(dag_id="join_dag1", start_date=days_ago(2), schedule_interval="@daily") as dag:
    d1 = DummyOperator(task_id="d1")
    d2 = DummyOperator(task_id="d2")
    d3 = DummyOperator(task_id="d3")
    d4 = DummyOperator(task_id="d4")
    j1 = DummyOperator(task_id="j1")
    j2 = DummyOperator(task_id="j2")
    [d1, d2] >> j1 >> [d3, d4] >> j2
