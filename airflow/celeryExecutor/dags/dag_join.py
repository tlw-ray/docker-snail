"""
Example DAG demonstrating a workflow with nested branching. The join tasks are created with
``none_failed_or_skipped`` trigger rule such that they are skipped whenever their corresponding
``BranchPythonOperator`` are skipped.
"""

from airflow.models import DAG
from airflow.operators.dummy_operator import DummyOperator
from airflow.operators.python_operator import BranchPythonOperator
from airflow.utils.dates import days_ago

with DAG(dag_id="join_dag", start_date=days_ago(2), schedule_interval="@daily") as dag:
    branch_1 = BranchPythonOperator(task_id="branch_1", python_callable=lambda: "true_1")
    join_1 = DummyOperator(task_id="join_1", trigger_rule="one_success")
    true_1 = DummyOperator(task_id="true_1")
    false_1 = DummyOperator(task_id="false_1")
    branch_2 = BranchPythonOperator(task_id="branch_2", python_callable=lambda: "true_2")
    join_2 = DummyOperator(task_id="join_2", trigger_rule="one_success")
    true_2 = DummyOperator(task_id="true_2")
    false_2 = DummyOperator(task_id="false_2")
    false_3 = DummyOperator(task_id="false_3")

    branch_1 >> true_1 >> join_1
    branch_1 >> false_1 >> branch_2 >> [true_2, false_2] >> join_2 >> false_3 >> join_1
